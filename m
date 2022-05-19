Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980052DE2B
	for <lists+samba-technical@lfdr.de>; Thu, 19 May 2022 22:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YiG6Vv3MhWHwb/Q0eXkaDG83/ytRdDAkm9103cqHfeQ=; b=iPJsU5cFFdpvydGwajcf3VU8+5
	DOtF2OpyQyn4Y3fqJz1PlbJzH5+WTE3sBg0lNQvOxogm7Hc1P5BMfK6jnOTIhVkVShkT2n7ocA2Uq
	TkPBCwSzvV2SPlPHWBYPPHX+QfJFWDgyxe1hZbNewg5ESuh4xvasPeB016OmT0Mzkw6ItpykQ6PWA
	b9wt2eUZ68hGDEGNligSMmf6zROVPZVHkEnyfwUwqPHYDKfL8aiJTyHCj2sXKok2tRujwBHl9fvNL
	vDXKikQ/NXJZTJmTU8R8MJEM9dz0gZL6hzlpYCKoq9zcZrvlPW5gmetMLfCNUb/VWswcEv+TzskkQ
	Zl11Br4Q==;
Received: from ip6-localhost ([::1]:51840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrmZ4-00259d-Hb; Thu, 19 May 2022 20:16:06 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:36617) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrmYx-00259U-RT
 for samba-technical@lists.samba.org; Thu, 19 May 2022 20:16:04 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D4AD140A62;
 Thu, 19 May 2022 23:15:49 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7F95711B;
 Thu, 19 May 2022 23:15:47 +0300 (MSK)
Message-ID: <c5e2be16-bd32-a758-3293-2a1c149a1b9c@msgid.tls.msk.ru>
Date: Thu, 19 May 2022 23:15:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Content-Language: en-US
To: Alexander Bokovoy <ab@samba.org>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
 <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
 <YoaJUS5Gn0MqIl+L@pinega.vda.li>
In-Reply-To: <YoaJUS5Gn0MqIl+L@pinega.vda.li>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

19.05.2022 21:15, Alexander Bokovoy via samba-technical wrote:
> On to, 19 touko 2022, Michael Tokarev via samba-technical wrote:
...
>> I don't know (yet) about smbd-shim which is also needed by libsmbldap
>> but which is not a usual library.  But this is enough already to fix
>> the underlying issue (of binaries being unable to find their dependencies).
> 
> smbd and other daemons that load smbldap link to those four missing
> libraries, so there is no problem for them in real life. On Fedora we
> have it this way:
> 
> [root@dc ~]# ldd /usr/sbin/smbd|grep security
> 	libsamba-security-samba4.so => /usr/lib64/samba/libsamba-security-samba4.so (0x00007f21bc859000)
> [root@dc ~]# ldd /usr/lib64/libsmbldap.so.2.1.0 |grep security
> 	libsamba-security-samba4.so => not found
> 	libsamba-security-samba4.so => /usr/lib64/samba/libsamba-security-samba4.so (0x00007f8e3ee0a000)

it is exactly the same on debian, -- it is the same code after all.

...
>> Looking at the whole picture, it seems like the dependency problem
>> in samba is *huge*, there's just a few libs which gets their deps
>> correctly, vast majority of them are wrong. I don't know if it is
>> worth fixing this mess, -- at least it should be done by someone
>> who knows the thing just a bit.
> 
> Samba went through at least three or four build systems during past two
> decades exactly because we had a need to express complex dependencies we
> have. At some point there was a library called bigballofmud that simply
> linked all the pieces needed for smbd. WAF expressions allow to solve
> most of those problems now but they aren't a replacement for the cases
> when code morphs and gets refactored/moved between components. Human
> intervention is still needed.

Yeah, I know about the build systems (I've been here since samba was
moving from samba2 to samba3 and have seen many of that) and I know
about this stuff tending to bitrot quite fast, too.  Maybe there can
be some automated way to detect these things. Again, maybe wafsamba
can help there. The prob for me is that I don't understand it at all
and there's no one around who does, it seems, -- all my questions
about it basically went unanswered, except - like in this case - when
I answer to them myself. I don't know python either (but ofcourse can
read it. Eg, I weren't able to figure out how to print a name of the
library being built).

>> I'm fixing this in debian, but I'm not submitting a patch to samba,
>> since it's just a waste of my time.
> 
> No, please submit them upstream because otherwise it is going to be
> waste of your time every time this happens.

Now I know how to deal with this. The prob with submitting is that all
my patches goes to /dev/null, even the simplest spelling fixes. I had
enough of that.

Thanks,

/mjt

