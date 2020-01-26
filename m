Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF1149977
	for <lists+samba-technical@lfdr.de>; Sun, 26 Jan 2020 07:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=L9UuuvBPW77d5qakzr6msLW8F44Ah8MCSqn6s3ZIz3c=; b=BDaqfwbv9OyPM+w0d4GQ+tYuA6
	hoirIChGYAjVVV2zky7/aNaqIEUl4ZIALy+7tQPdt2DynyzCrhHXYaX0s7kw0L+WLXb21UXE6/NO/
	LasNAL9UchkV4ah+9DFEoAE+2DtG5H/SHtwoN4KyPoj8wKMWoJGZa31pSBYw6+bF1C59PKtQV0VAe
	b2ZAG2xkXYIqh0ChhmcdQbE1xLa6wLDiUNvSVYmdvf3BA/xPX/T/SmVNuDqGrKsUjHDpQMg1+StgT
	cVQnGxWPsShGp8AGIsq3raBX2d+4zKZu2/cJzT4i9sX0C10mHmU74Kf/WbnFv/H7cYXf26Rsncq/p
	zN5GOccA==;
Received: from localhost ([::1]:38938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ivbmM-004mRj-Vy; Sun, 26 Jan 2020 06:52:19 +0000
Received: from mout.gmx.net ([212.227.15.19]:54995) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ivbm9-004mRc-7O
 for samba-technical@lists.samba.org; Sun, 26 Jan 2020 06:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1580021523;
 bh=4oZ/le2kCAWyVDQP2zO9T1EUvX9bwDgRvBTL5V4m6J8=;
 h=X-UI-Sender-Class:From:Subject:Date:In-Reply-To:Cc:To:References;
 b=e+KQDmpWhluMx5Gg/AALaAGocMER2ckQ3nk0Idd+kK/gmzzWPe98Cpz1PsNciFbtv
 oxonk+dpSkMUHMryQmML8ZnlOwmbjCN6CzI7dENDF56jMUumEtaQUxmi5i5OiXwr4K
 6jMWkvedlMC2IKAqrlXolqDhHrPs3TLMy2WD3adc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.254.213.125]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6DWs-1ixndC3JBw-006cP4; Sun, 26
 Jan 2020 07:52:02 +0100
Message-Id: <1AC2EC10-48DE-4EC6-B88F-0C7AAE6E7C60@gmx.net>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: regshell.c: compiler uses -m32 as well as -m64
Date: Sun, 26 Jan 2020 07:52:02 +0100
In-Reply-To: <bfb0a2aed55e58e3f40822fd1bbc7815042a9a16.camel@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
References: <F2128FA3-16EC-428F-8E37-447C96E99F90@gmx.net>
 <bfb0a2aed55e58e3f40822fd1bbc7815042a9a16.camel@samba.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Provags-ID: V03:K1:5ABEVpPb1EwHcGpiBwsCZrbNO18fnl2Paip85L7tH2iWfapt0yN
 Sag8zsfyb7cVSCBbwyDl+ofkcegcLh9D8mjNRBwz0N1QLe+n+LeEL4PECtpr/DuRn56leSz
 8hSK3iaYwoeghJm5fIvzOnBdIw92ZLIqf1JfrFBu+cI0nWA9iWw3E5GfLJ6+TXBuwJFS3Sj
 V72tldRl8tnPdShL8Cbug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JySUdIL8Sqs=:tSbyfj6hfXuCWf0teaMC4U
 4oy/hRr8QHld71yLS2+vmc/E2OOP5k67sKKsLBgPG+2xgy0EvKxjKOwGW6lY4U3GhGGBvrSbh
 6udCXH5CHRYOXyW0HW5iUKU1OYP4+RJ4HQbd8B2Nm/MAt4EtnhoJ6PSeSzYEi5q3igbE6XJ/d
 vK9D2HNlIHdRTXBhDTCfn2Yk15nox6Oc2KCIwZJ9lNrWOWkJSvtmJLrD8CU/82xGlrH11MAb9
 LL/+baGpHXEztCl1chDnqrrgvww6G3T2WDeCg7+cLUKydBY+rl9TOqb5OpzAObJsjwecsxw45
 hs+hgVprvDK96Xy0Aq2y0NZIDuBIYNmGbR8RkjsOvBhLOsEvfhSMGwEG7/5wl2lS9rtvXP8FF
 nZHzlcRka5sp1VPFFPexe/7y6MO1CNEc8MtEERExeNf9h+Jx5wHwk2W+zXwk4I0RGPzRrcSGA
 2H5APpoCJ2z9NIDz7YiNqfqJECG2HHbLIJ0RSmApirW9WFWKoHGbwH1woz111c5h5X5ru94gE
 RIxhEoMNMOtYCz9LF5jQUP1BqDd/d33OA++cZxGLb7sSjJktTZdsfWJ3zD/WCiruYkeHdtpyZ
 18VZjHnAsaIbmcgxSNXpu9xdCw1WIMfHDEYgLzwp2fy+h3jkvVttZ93ikn1+hFidVqbwiHMPa
 Yt4dhDX/oHLGv9+StD8UtahF5x6HEVTkvD2KMtMUR+zbN+0Ob9ovv/6f2xDSPWSoKCOYlneMR
 E3x5aYFIos9x2jSvqDYh8eRFjbwV7cmUK9lmqKQph1htIVhf14Lo+qA4Te1RU/QoZJrec01i9
 5GbvMtN3mr/UbSQ8o71sfNcgHz3kbPvIVhFIFENLyzIrGBxHosESx6GXuO/ev8XbsJ/7O6Xfn
 8tAtrz/if0TNY0l042zBYRMz9dKh7FIRq4lO9hBrP2cciPZDhZZ/7dUzpkdSQf8gw/JqczkBU
 bZ/Kt00QLppe1LSievivT5enfxOX2ELTvIkc3JHH48BXOnwEl5RPu44vBZ84K8jRZCKHdQi8P
 nWYtSc1200YcRWkRslHxqOfwDfkAH4YkVzDtpW8G6YCoI4JDpleNlQHFIxSM03BFCMye+BxvF
 Y87LQbBrgrVrelg7GGTP68qENqcpE1xCrBfs+wOXc+pnS6sdSK5chSoE+tPxhDc38c0wueHVr
 bKWxYt1QrQ9+y/pUNfV2rKwrUUiT56Q44kmLBNgmsF34t+xDYzDqmh7QQrUBqXhC9Ej+L8chy
 MLi2PfylGBu61xfKn
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Rouven WEILER via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rouven WEILER <Rouven_Weiler@gmx.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The system is Openindiana which is based on Illumos. Frankly said it is =
the =E2=80=9Egcc=E2=80=9C version of Solaris.
Right now I just wanted to update to distro-package. Therefore, on e =
just needs to change the Makefile in the respective package build =
system.
For an impression here a link: =
https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/components/netw=
ork/samba/Makefile =
<https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/components/net=
work/samba/Makefile>
Using that build system I actually do not set the -m64 on my own, it it =
done in the background of the openindiana Makefiles.=20
If samba does set that also I cannot tell as I am not very familiar with =
waf.

Version 4.11.4 of samba worked very well in that build environment, =
version 4.11.5 throws a "READELF32 error" when linking "regshell.15.o=E2=80=
=9C
regshell has that compiler line I already sent containing a "-m64=E2=80=9C=
 as well as a "-m32=E2=80=9C which does not seem correct and causing the =
linker error.
So my main idea was to find out why there is this "-m32=E2=80=9C and =
probably kick it out.

Referring to ncurses: I do not see how this would harm the build. Could =
you give me some more background.

Thanks.

Rouven



> Am 25.01.2020 um 21:05 schrieb Andrew Bartlett <abartlet@samba.org>:
>=20
> On Sat, 2020-01-25 at 18:14 +0100, Rouven WEILER via samba-technical
> wrote:
>> I tried to compile samba-4.11.5 using "-m64=E2=80=9C since it is a =
64bit system.
>> The most parts compile and link well.
>>=20
>> regshell.c does not. In the compiler command I find a "-m64" as well =
as a "-m32=E2=80=9C.
>=20
> Can you explain a bit more about the system, and why you need to
> specify -m64 at all?  (I've not heard of this done before).
>=20
> As to what is different about regshell, it would be the only ncurses
> program on the system, so this is what might be different.=20
>=20
> Andrew Bartlett
>=20
> --=20
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT          =
http://catalyst.net.nz/services/samba
>=20
>=20

