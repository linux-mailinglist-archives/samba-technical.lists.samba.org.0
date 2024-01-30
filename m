Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096984211E
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jan 2024 11:22:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=LpXwuIFpHjgBiBoe+FaYABzUUW+hUlKBSKQX4RxhLIA=; b=wyRhPuT66cdaW6MTJyObVMiNWp
	ffmzRQJQ5yo5vn3J9ERm9ndKn9KTedUa9fg+vPTyO3RaAqIBuFFZAuFUiiMv04eA+6UXantNp3k88
	cmVePzEbNB9KWNnVFgX64attZ44ggaXDTOxAk2O5DWB3CMN/9b7Z4Mia662snx/SFt05a/Fkgkxma
	LC1JM71JR/pytXnBWC1tJRl2sqGI3jE77pvXri1yWXwoMjKIkpWc4rCddNRo2v/wvV1pAP6/0aNI6
	BjIAQ/C51mqpKPhqUu+yWFoHmHs+0fhE/SPK0KM9MpOqSCaAt3Qtaf7OzCXN/eP7nHuYX0OzUsv+U
	TAHpajhw==;
Received: from ip6-localhost ([::1]:29930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUlFR-0053sj-EL; Tue, 30 Jan 2024 10:21:45 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:33441) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUlFM-0053sc-Hm
 for samba-technical@lists.samba.org; Tue, 30 Jan 2024 10:21:43 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6E60048B31;
 Tue, 30 Jan 2024 13:05:50 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D3D4B6ED1B;
 Tue, 30 Jan 2024 13:04:55 +0300 (MSK)
Message-ID: <6906e5c4-edbf-4731-a254-3a08bc4b3e31@tls.msk.ru>
Date: Tue, 30 Jan 2024 13:04:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libndr 4.0 issues.
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <e7c468ef-5466-4ae7-97c9-39c9fe6d627e@samba.org>
 <9aa8499f-c764-4963-8112-a3f571f2a237@tls.msk.ru>
 <9dbc25ad89a932a035c943c7a4b9c1de37441996.camel@samba.org>
In-Reply-To: <9dbc25ad89a932a035c943c7a4b9c1de37441996.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

30.01.2024 02:38, Andrew Bartlett via samba-technical wrote:
> On Tue, 2024-01-30 at 01:25 +0300, Michael Tokarev via samba wrote:
...
>> The only fix for this breakage (which was trivial to prevent in the
>> first place)
> 
> Can I get some detail on the trivial steps that could have avoided
> this?

I did quite some thinking today, some experiments too, and looked much
more closely at the actual ABI changes.  And the situation isn't as
simple as I thought about yesterday.

Note "trivial" here is a relative term, it is trivial compared to what
has to be done now (which is to create stub libndr.so.3 with conversion
functions of the same name for libndr.so.4 extending flags argument,
with ld script "magic" and dlsym(RTLD_NEXT)), not necessary trivial by
its own.

And here, there are 2 roads actually, one is "right" but not exactly
trivial, and another is hackish but simple.

Let's take ndr_size_string() as an example.  It is (in libndr3 vs libndr4):

  ndr_size_string: uint32_t (int, const char * const *, int)
  ndr_size_string: uint32_t (int, const char * const *, ndr_flags_type)

so the easy solution is to have a new function, say, ndr_size_string64
(or ndr_size_string2 etc), and have ndr_size_string to be a macro to call
ndr_size_string64, and a trivial ndr_size_string() function doing the same
thing for compatibility with previous versions.  In other words, to
redirect all "32bit" symbols to the newly added "64bit" symbols of the
same name.  Yes, such wrappers had to be written for all changed functions.

There are a few other interesting differences. For example, ndr_set_flags()
accepts a *pointer* to libndr_flags.  And here, we're breaking the *API*,
not just ABI, because now a program using this interface has hard time
determining if they should use libndr_flags (which is new in libndr4 too)
or uint32_t.  For this, a new separate function is preferred either way,
with some simple compat layer.  Thankfully this symbol isn't used often,
so there isn't much breakage with it.  But for a general case, such
argument type changes should really be done with a tiny compat layer
(maybe with a deprecation warning for one release or something).

Now, the "right but not exactly trivial" way would be to actually use
the symbol versioning mechanism.  It is not a black magic, it's actually
quite simple once you understand how it works.  So that will be the same
set of (wrapper/compat) functions but done in a stright-forward, clean
way, without hackish re-#defines.  You write ndr_size_string_v3(uint32)
which just call new ndr_size_string(uint64), and mark the v3 one in the
ld script (or right in the code) as belonging to the previous version.
Having ABI/*.syms files makes it easy to implement proper symbol versioning,
but this has to be done (so at least some python/waf code needs to be
written), and done in a way to be at least somewhat compatible with
the before-versioned symbols - that means, at least on per-library basis,
after ABI bumping.

> The reason we make a release candidate, and the reason we so
> greatly appricaite your efforts in packaging it, is to see how ideas
> that seem reasonable in development impact on the real world.
> 
> Note that the libndr flags that are now 64 bit are included in
> the ndr_pull and ndr_push structures, not just in the function prototypes, so I don't think symbol versions or munging etc would do the trick.

And this is something I overlook yesterday.  This needs struct
adjustments, - ie, allocating new struct, copying all fields
with conversion when needed, running the new function, and copying
back.  Since the current/old code does not use "larger" flags,
this should work, but it is a bit fragile for sure.  This is how
system call translation layer works in qemu for example, converting
between host/guest type sizes and byte order, and works quite well.

I can do the wrappers work (and maybe I'll write a libndr3 stub
with the conversions, if the way I think will actually work, - it
is fragile, due to symbol name being the same, it may lead to old
code calling new function directly instead of the wrapper depending
on the order of loading).

> But your feedback is valuable: we didn't end up needing the 33rd flag
> quite yet.  The work was merged into master to ensure that the idea
> landed while it was all ready (rather than needing to be re-worked
> after being dragged back out of the attic).

> So we could include a patch in Samba 4.20.0rc2 to remove the 4.0.0 ABI
> and instead have a 3.0.2 for this release series, and punt the problem
> away for 6 months.  I would note that this still creates some of the > 'non-linear ABI version' issues you have noticed in LDB, but perhaps if we plan properly we can sort that as well.

I don't think reverting this is a good idea now, it will be quite messy.

What is actually needed, I think, - is to decide if libndr is a public
interface or not.  So far it is used in external projects (sssd and
freeipa at least), but is treated more like an internal library in samba
(unlike, say, libsmbclient).  And if it is public, we can try just a bit
harder to avoid breaking compatibility, - maybe not for case like this
one (which changed - while in a trivial way, but changed *many* symbols
at once) but for previous changes like ndr1=>ndr2 or ndr2=>ndr3 bumps.

Also, at least in sssd libndr is used very lightly, - maybe it is worth
to re-implement a thing in there instead of pulling it from samba.  But
I for one still don't know what sssd is used for to begin with :)

At the very least, I just implemented a trivial trick in debian/ubuntu
to ensure we know we're breaking older stuff by the new samba, instead
of allowing things to install just to discover something broke which
needed older libndr :)  (rpm has better support for symbol deps than
dpkg).

Thanks,

/mjt

