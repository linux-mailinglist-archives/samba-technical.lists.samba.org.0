Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174752DC98
	for <lists+samba-technical@lfdr.de>; Thu, 19 May 2022 20:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=v/Pv2MvuqJ8P+bP3qH+LEoTVadlgZc6IuQoDJInhAGQ=; b=g6cc50KXmQQJjGuIihHK202RJa
	UGJ17IXorRo0cN3HQu9kmpuE8+nHU5elIiI7oRi4YcWGqsTre3g6C+mtviVnFbsD9moWF2DZwwjUM
	MHfp19zW9AKuOVdXrBdCPlsnCkiKOVAK/CjPaUkoW45q9klFF2AKwhngz/HtuGOQGTejEMt2LRjwm
	RtdZ3L9ehALutvg2kEqHJxSomHPdrmIr03Bi6qCAbgg/eZBUmNofn6bN6G72dUY++85sawvjkBEJM
	e9zUEG359esE7omOfssjINHrKVtZv97awBhqf1zUlgWAHoGui0FPSND2OCh2b2MMs5o6MG6lT68dX
	Lj6c/sRg==;
Received: from ip6-localhost ([::1]:51070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrkgl-0024cT-TT; Thu, 19 May 2022 18:15:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61684) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrkgh-0024cK-Sd
 for samba-technical@lists.samba.org; Thu, 19 May 2022 18:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=v/Pv2MvuqJ8P+bP3qH+LEoTVadlgZc6IuQoDJInhAGQ=; b=ih+9RqVe7KwIop6dosP5xfKCIR
 u0OPymkYgk4oeQIw5LMO5mFUpkW0GNJWQrAii9rlWEW3YwFbplBNxbJmurYZT9YSQ4FM5i8RpSfxD
 Yz64F1qef5w72rNZWfxRcOprpup0MOXE2+q2iJcRMAv8sLSFtu2xC/Vl2eRPS5edHQ0ZOB2ey0IVg
 IzzWRRfX6zlv4Vxt/1htLtUJbeYRBxKa8QxGjeukeVYmRGsHGPzYQH4p9ZMvuH+8wES2A6xvPy2Z7
 Bj9mBvRq8Kw3PerWPrKUDRhjpV2TEuOoWjCAOuq+1fmeA/VuJ0Rz3W8dL0pSHN2jyx8tOUpkNHH22
 MqRkrUg8p02tdejpRKt2D7BobKEmPjvdjWfrQPShIHivDCyN30CY6tKOhit4p+H3xvIkr9cwdQ1D5
 w1t/a4mIhjj1Hs0ReN5QCgL6qBdbU5gEi/ddKysqj/Jp8AI93+C/bila9LF0BLyI1ivGg1E3WDwfB
 k8xGFwBErUAnlyiGUH8FygLG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nrkgd-001g8x-64; Thu, 19 May 2022 18:15:47 +0000
Date: Thu, 19 May 2022 21:15:45 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Message-ID: <YoaJUS5Gn0MqIl+L@pinega.vda.li>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
 <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 19 touko 2022, Michael Tokarev via samba-technical wrote:
> 13.05.2022 12:35, Michael Tokarev via samba-technical wrote:
> > Hi!
> > 
> > In debian we've got a bugreport about one of the samba libraries missing RUNPATH
> > to the private library directory (where libreplace-sambae.so libsmbd-shim-samba4.so
> > etc are located.  This one is libsmbldap.so.2.1.0. And indeed, unlike all other
> > libs and executables, this one lacks RUNPATH section, while all other binaries
> > does have it.
> > 
> > $ ldd /usr/lib/x86_64-linux-gnu/libsmbldap.so.2.1.0 | grep found
> >      libsamba-debug-samba4.so.0 => not found
> >      libreplace-samba4.so.0 => not found
> >      libsamba-security-samba4.so.0 => not found
> >      libsmbd-shim-samba4.so.0 => not found
> 
> source3/wscript_build:
> 
> bld.SAMBA3_LIBRARY('smbldap',
>                     source='lib/smbldap.c',
>                     deps='ldap lber samba-util smbconf',
> 
> All 4 of these are not marked as "private".
> 
> buildtools/wafsamba/samba_utils.py:install_rpath() only list private
> libdir if at least one of the dependencies is marked as private.
> 
> but since libsmbldap is actually uses symbols from other libraries,
> as determined by the linker (all these are listed in NEEDED section),
> it seems logical to include these in the dependencies. So after this:
> 
>  bld.SAMBA3_LIBRARY('smbldap',
>                      source='lib/smbldap.c',
> -                    deps='ldap lber samba-util smbconf',
> +                    deps='ldap lber samba-util smbconf replace samba-debug samba-security',
> 
> it builds fine *and* includes the private library path in the resulting
> library, so that ldd etc is actually able to find the above 4 deps
> too.
> 
> I don't know (yet) about smbd-shim which is also needed by libsmbldap
> but which is not a usual library.  But this is enough already to fix
> the underlying issue (of binaries being unable to find their dependencies).

smbd and other daemons that load smbldap link to those four missing
libraries, so there is no problem for them in real life. On Fedora we
have it this way:

[root@dc ~]# ldd /usr/sbin/smbd|grep security
	libsamba-security-samba4.so => /usr/lib64/samba/libsamba-security-samba4.so (0x00007f21bc859000)
[root@dc ~]# ldd /usr/lib64/libsmbldap.so.2.1.0 |grep security
	libsamba-security-samba4.so => not found
	libsamba-security-samba4.so => /usr/lib64/samba/libsamba-security-samba4.so (0x00007f8e3ee0a000)

If smbldap is actually using those symbols, chances are that
dependencies weren't fixed when their use was added in the code, so
fixing dependencies now is reasonable.

Please submit a merge request that adds them, same for the libraries
below.

> 
> The same is true for other libs which are also missing private libs
> directory in their RUNPATH:
> 
> File: /usr/lib/x86_64-linux-gnu/samba/libads-samba4.so.0
> File: /usr/lib/x86_64-linux-gnu/samba/libnet-keytab-samba4.so.0
> File: /usr/lib/x86_64-linux-gnu/samba/libsamba-modules-samba4.so.0
> File: /usr/lib/x86_64-linux-gnu/samba/libsmbldaphelper-samba4.so.0
> 
> adding their corresponding dependencies in wscripts fixes the issue.
> 
> Looking at the whole picture, it seems like the dependency problem
> in samba is *huge*, there's just a few libs which gets their deps
> correctly, vast majority of them are wrong. I don't know if it is
> worth fixing this mess, -- at least it should be done by someone
> who knows the thing just a bit.

Samba went through at least three or four build systems during past two
decades exactly because we had a need to express complex dependencies we
have. At some point there was a library called bigballofmud that simply
linked all the pieces needed for smbd. WAF expressions allow to solve
most of those problems now but they aren't a replacement for the cases
when code morphs and gets refactored/moved between components. Human
intervention is still needed.

> 
> I'm fixing this in debian, but I'm not submitting a patch to samba,
> since it's just a waste of my time.

No, please submit them upstream because otherwise it is going to be
waste of your time every time this happens.


-- 
/ Alexander Bokovoy

