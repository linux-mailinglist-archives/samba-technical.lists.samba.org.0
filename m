Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C54FC4FA5D0
	for <lists+samba-technical@lfdr.de>; Sat,  9 Apr 2022 10:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ir1dJZ1arAYPUaOyGeUb2laisXQY9sesnCP0VcXxhEE=; b=fe49ikq9fEIH8Dtxbpi2NFQJGW
	qap48aQ+nO8bdJdPqfwSMup9xurStXxDrRpeYQbbNXvOyr/wL2oNwRtXDjW5UEnqnREyyVvl3ZhuM
	QwaE1gfnbI/L5HVNT1UOkftbVH5PTW7691ca9Hn+r3mr6LGNengDKAhUIojG0dFtPNLRveK84HjB9
	dZAdQTn1J6QuV1DMb/fja1C71V6alM51YIK3Grm1ig7SJdzAmAhUKtOHUXJg99dxS1JPC2c9PeySy
	zzr1jSP4SpyKVuPN6RUXK4aY0wzmLz4F4e4ES2lzxL70RQq8zR9DbDeY4BfamhTBNcqWwMLr8H0XN
	fuulX+aQ==;
Received: from ip6-localhost ([::1]:38076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nd6EY-00BILv-9l; Sat, 09 Apr 2022 08:14:14 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:58439) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nd6ET-00BILl-9w
 for samba-technical@lists.samba.org; Sat, 09 Apr 2022 08:14:11 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 77AEB40161;
 Sat,  9 Apr 2022 11:13:58 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0E0A1352;
 Sat,  9 Apr 2022 11:10:13 +0300 (MSK)
Message-ID: <bb99e0b1-ceaf-fa70-8830-6eb2f145f273@msgid.tls.msk.ru>
Date: Sat, 9 Apr 2022 11:13:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf and building python modules for multiple python versions
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <d210d52b-40f2-9420-9c12-9b5207fda5a1@msgid.tls.msk.ru>
 <8368b49259376d59184da5aadc7c156226b950a4.camel@samba.org>
In-Reply-To: <8368b49259376d59184da5aadc7c156226b950a4.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

09.04.2022 10:52, Andrew Bartlett via samba-technical wrote:

>> Here with waf, I don't see how it is possible. Well, I do
>> see one possibility: to copy source into yet another separate
>> subdir (as many subdirs as there are additional python
>> versions for the build) and run configure & build & install
>> in every of them in turn, specifying the right PYTHON= in
>> the environment.  This *should* work.

This way appears to be too fragile, since it requires the
dependencies to be done with extra care.  The thing is that
it is not enough to *link* with a different python libs and
use version-specific soname and library name. This also require
recompiling of the .c file with the right python includes.
While *some* of things will continue to work when compiled with
one python includes but linked with another python libs, it
definitely is not supported.

I'm not sure all .c files python modules are *compiled* into
.o files with python-version-specific names, if at all.

It is actually more than this.

I just built talloc with default python 3.10, removed
bin/default/libpytalloc-util.cpython-310-x86-64-linux-gnu.so, and
re-built it thysly:

  PYTHON=python3.9 make

and it re-linked the same libpytalloc-util.cpython-310-x86-64-linux-gnu.so.
So apparently it recorded somewhere the python binary which was
used during configure.

> That is the only plan I can think of.  But which python version would
> Samba's python-using libs link to?  For as long as you ship smbtorture
> and expect it to work you would have to do multiple versions of that as
> well...

It is not about samba proper. These will have to be recompiled as
a whole anyway.  This is about libraries (talloc, tdb) which are
used by other packages. When your default python is 3.9 but 3.10
is also available, you build, say, python3-talloc package to contain
*two* versions of the pytalloc module (containing
libpytalloc-util.cpython-39-x86-64-linux-gnu.so and
libpytalloc-util.cpython-310-x86-64-linux-gnu.so ).  Other packages
are built with whatever python version they choose, this is not
relevant by now (either of 3.9 or 3.10).  Next, you switch default
python from 3.9 to 3.10. If a package used 3.9 module in talloc,
it will just switch to 3.10 one which is *already provided* by
python3-talloc package, there's no need to rebuild python3-talloc
so that packages using it will work after python version switch.

But if python3-talloc is built with 3.9 python *only* (as it is
the case now), in order to switch python version, we'll have to
recompile python3-talloc to provide 3.10 version. But this means
that all programs which used 3.9 version-provided talloc will have
to be recompiled *too*, since after python3-talloc recompile it
wont provide 3.9 variant anymore.

This is why it is way easier for transitions if the cpython-providing
packages provide two versions of python libs. It becomes *dramatically*
less messy for transitions.

I'm not talking about samba internal libs (used by the main samba
package, smbclient and smbtorture) - since these all are built
from the same source anyway and have no other packages (outside
of samba source) using them. It all is rebuilt in one go and all
packages are updated at once.  I'm talking about utility libs
which are used by other packages too, which are not built from
samba sources.

Thanks,

/mjt

