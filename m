Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 648081DF717
	for <lists+samba-technical@lfdr.de>; Sat, 23 May 2020 14:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=j2/s/4tZ4KdUNwmKrYrfOIsrnLY+Tz1j5LImKks/TJ8=; b=ovfu0vj6PBtOlzHLM+MtwGTgDj
	AKTvSceNhZ4TJ32WcoE5xxMKTMArYapveZ62AyqLOZPBjrNfiEmx1fnF4RRfmIM1qMbUtjMlGMMJ1
	oZLUmtuVTSOplJTbi0RDWimOEVMXen1wrKobVgGJeK9WvGK0lZmKc3m2jjRZxGfNMSi0dQykgD+OV
	oTrwQJ7eX2fiM2GTNmwF3RMlAiwGVLb55ZdRkh3mdMaYl2hB2UZ7SWa7N71jiBHWONIjXkLpW8LD6
	f45mfh8+tbXnulJK3HIWV7hOzVIN5f2keSLPF0ICL9b9M6EtgwzkgQS67G6xXKLMZQmLjOpuf1zjc
	HvcCVJkQ==;
Received: from localhost ([::1]:65096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jcSv6-005aKD-6e; Sat, 23 May 2020 12:06:28 +0000
Received: from mout.gmx.net ([212.227.15.19]:39507) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jcSv1-005aK6-05
 for samba-technical@lists.samba.org; Sat, 23 May 2020 12:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1590235581;
 bh=Tr1MrALBiQmzcVuEYyn69VhRJJQArHzZjyorWM65Wfw=;
 h=X-UI-Sender-Class:From:Subject:Date:In-Reply-To:Cc:To:References;
 b=cp4IrnkjIoFmW29uc8JQ7a5ma5AVmsnKzJsJMc3ztqB98S13DQMcxA2rqb8UlfEES
 QiIFUgh31KwP/8fYmGFa5kdM13tGRABqmBt/IRc9hwccD9sBMcgjAryAcbDs8ohx9Q
 F+W6MTAuGFQyoWIxNwr3elJk3oxY7UEO9fpbgOEw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.254.199.176]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1j5b0937RA-00g2nU; Sat, 23
 May 2020 14:06:21 +0200
Message-Id: <1DC20ABA-03D5-42A5-ABE1-944A5ACBFE0E@gmx.net>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: BUG 14352: follow up on that bug. Still issues.
Date: Sat, 23 May 2020 14:06:21 +0200
In-Reply-To: <2f3f9bfa-ab22-4ab8-6205-11f967a98c0b@samba.org>
To: Ralph Boehme <slow@samba.org>
References: <0A3C18BE-42EE-4394-B2B4-CD183F0431A3@gmx.net>
 <2f3f9bfa-ab22-4ab8-6205-11f967a98c0b@samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Provags-ID: V03:K1:ZL05TSgeLym4PmRZbcyuGxl66weQx4uLp9X73npBaBoYhi0YMbq
 vMRV2KPmUbkMr3QjIEbyDzAtopgKhBYdG8b4BPTHksRwA2SCNJHLBeCsDzSBxFSu7C5i2Xt
 B9Sn8Hb0Vvr3+4fBmwGYBNzfiZ2yBcCNo40LoFddJua+Xjs+Vl7t1uSrEUeaqNyy7CiYeym
 kKzsGFaSEEcpT4yUBVJKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RVQ+AO5xN0M=:x8PXo6hedD0lQL8yXUPGNb
 UpvAYsSlrhK3MlvHdaXW9fRYAAfPbTPzUVIpAdcU+RzEqZb9gJYHrlwi3gWxSnA2oDvm1Esb4
 9YO/7ak1QikzK3uokUNCkmtQlE7y8ABcPMhIPkQuLxtIVRrLOOfAwJlV9h7UDZ/c6Spqr8YSX
 jqpEV4ANWQNno7AUF9r+bm7/CmjQRsspXqW0qqZBkz28IwrW77E+JR+vBknOEKdm3Rh/DWU1M
 hivKhrbd7TSx8afsxf8yGcGpNhGOYzyudd5nQpmT1FWgkk9o1/hE40ilIFZZiJgNpqmo9XrrR
 6d7J9GiQvaB90WI22ZO8BbeTbU6XfbFMJfzYSd0m1LfZB+TKQeqLWxWOJ6rNo08uxlKzsC6no
 XTfZRI+RULCAjepWM2y514kHpzmylrVmKoivCiL28m0OQvn0AXk6vFUwEhCNSNh1SpHLRxjjw
 hWL0ymRhmwm/Vs3K5ehJNenfHiEbsNfU00x6jm/3lnaE5yEnjru3BsJOLcUrSgr66nOJ7R8yQ
 kvCq29catv2Atf/jYG8QnvQ+A46M7ltNBKQnuSbNgaGbeh5ThMbQXp9O3v8GMe546AGnMR17q
 llND1k6lQxY6krQpVHKW7do/8BSutcxNKJxWF/QQ7FkGTuTRPzIA3A1I6vdhv18rgjJSmapXo
 0huinGfBZcnqkEsPzLjFhIrWHuiae0317vBziIy7DwTVBrComKSf8Ezo6WYmGC9QEq/BuX7Vc
 iMZJWxpBAiBgYyJ8BCQge+v2Mv5ysUipHWRvlwD9zgtcFm4TXhUwJ/aUL3AM4Tp8WSdAkVG0I
 gzpAgSNjdsZpbHCum2MW6bdmgWxESsCLQNmht3R7DW8xh8TGzR1Qki+eCEB8LNI+z2pUmoJPt
 1LRDzLGl0F1wL5dr0mT3iBbBY8P0A9pejkReGgBPF6hdrz8T3QsGyFD9dn6Q9/CmCTlWvxrLI
 kbwsovNQB11SiEGJciPQxj1kdzSRtVzdZ8HsdQJu1FpIcwr1qpb4hRpMX4i9lGhkzf3usjGLP
 K1aSqE6DcC7/ME3edcwpGdaVV3L7x3k3LxOHgb8kc9pRgW82ffOXpKubKG6KMzc83ue+ESVlM
 Y05FcgH5enSn2+jl+j942VMQiotrh7RcoBJ2qallo9whMIbnQ8VtqU5n0MjNT6rq8Z+SUADwG
 t/GBxXCxcZc4NQNVpOv5kxzME0iFJhY2K3kEgn38n5DtQ9oauPUvaHeaHCf/xKw9KSFMowsG3
 sUXTSdNsWHw5/Xuxq
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Okay thanks.
Bug is filed (Bug=C2=A014392 =
<https://bugzilla.samba.org/show_bug.cgi?id=3D14392>).

And yes: fruit:locking=3Dnetatalk is on.
And another yes: removing it solvved the issue. (Wow)

Is there anything bad using this option (outdated or so=E2=80=A6)?

BTW: The is another small bug in the code propagating mac os support via =
mdns correctly.
It is related to the port for the services announced by the avahi daemon =
which must not be =E2=80=9E0=E2=80=9C, but =E2=80=9E9=E2=80=9C.
=E2=80=9E0=E2=80=9C is not defined as an ip port and =E2=80=9E9=E2=80=9C =
is network dev null which would be perfectly okay for the purposes =
needed.

May I send a patch or shall I open a bug for that also?

Thanks in advance.




> Am 23.05.2020 um 13:52 schrieb Ralph Boehme <slow@samba.org>:
>=20
> Am 5/23/20 um 1:32 PM schrieb Rouven WEILER via samba-technical:
>> There are logs with log level 10 available as a tar.
>> Shall I open a bug in bugzilla and file them there or upload them to =
onedrive or so?
>=20
> please file a bugreport and attach the compressed logs to the =
bugreport
> if bugzilla accepts the size.
>=20
> I assume you have fruit:locking=3Dnetatalk, removing this should fix =
the
> issue.
>=20
> -slow
>=20
> --=20
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
>=20

