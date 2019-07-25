Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF874C0D
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 12:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=8b069+X3T4hpYt6omKLsPxjNs1KveTkVLSggWbrT1Qg=; b=IDGmRj8+favHcQBokgsQrnvW/0
	ez9QvBcfpjp6ruCxY9R1b28XrpHEiktx3Ih47A6+c01PwTCjro5dYKZ7D0Aa73ilf2Xn6gaGQIVPN
	VkEeUU4+Ln8pIJtm8ymdaXFll3SaXQgrvJmxHMB1F/9Jd8KMHgTCElP/LCygrrHp9WQO/WAbNmMQC
	qBptr168BsWBbIalHG/ZtG+2o2QFHl+6ETrkWoJ0m14Pv4nF/hOMr/ys9Kvrp+iB/EMEtMksbjnaZ
	YSNWtnC1OToZOdx0fejz6yPvxBXAonxEzD1FZQgh41+uWxQH4/Ekp46uNNBoU7NvBYsZ6TBtBj38y
	MBSyl37g==;
Received: from localhost ([::1]:55024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqbFN-000Bgc-QL; Thu, 25 Jul 2019 10:45:17 +0000
Received: from [185.16.48.59] (port=39606 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1hqbFD-000BgV-6A
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 10:45:09 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 07DAC4042B
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 12:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1564050470; bh=y0MYUjOF6XIsDxxVOJqG6/pY6DZuEgzB6tzOJVCw6Os=;
 h=Date:From:To:Cc:Subject;
 b=HqOGdxSLZQfy+iJk3Jqgao1oaGmWXl7/mi/N+c8i4hbGdkvvyzxs4Bbp09SccTx8b
 ZAo9VNpwZpx2I5Ge1i+gLO6TWIPA2tP1/p3ycJQAbqYQId2Xolt2uzcJQHsAkAjimz
 esgI3e/e4+H9J1TYjkubVuHKMljphiSthIBye0d0=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id E41CE2B
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 12:27:54 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vObB5pYoyE5x; Thu, 25 Jul 2019 12:27:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 984E069;
 Thu, 25 Jul 2019 12:27:54 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id i69uW0i6d_uE; Thu, 25 Jul 2019 12:27:54 +0200 (CEST)
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by mail.tranquil.it (Postfix) with ESMTP id 7FC4E2B;
 Thu, 25 Jul 2019 12:27:54 +0200 (CEST)
Date: Thu, 25 Jul 2019 12:27:54 +0200 (CEST)
To: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Message-ID: <1731211123.808.1564050474475.JavaMail.zimbra@tranquil.it>
Subject: Samba 4.10.6 python3-tdb dependency missing in samba control file
MIME-Version: 1.0
X-Originating-IP: [185.16.50.4]
X-Mailer: Zimbra 8.8.12_GA_3817 (ZimbraWebClient - GC75 (Win)/8.8.12_GA_3817)
Thread-Index: KXJ7QwlGXAueZ9I5hidlk/XDUBcAsA==
Thread-Topic: Samba 4.10.6 python3-tdb dependency missing in samba control file
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Yohann=C3=A8s_ALEMU_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Yohann=C3=A8s?= ALEMU <yalemu@tranquil.it>
Cc: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Louis,=20

We are currently testing samba 4.10.6 using your deb-src. Thanks a lot for =
your hard work ! I have noticed there is a dependency problem in your samba=
 package 4.10.6 : python3-tdb is missing from the control file, only python=
-tdb is in required dependency. After installing on my test machine, samba-=
tool is using python3 by default and does a stacktrace because the module i=
s missing. If you have a github repo for your deb-src, I can post a pull-re=
quest, although it is quite a trivial fix :-)=20

Thanks a lot !=20

Yohann=C3=A8s ALEMU, Technicien syst=C3=A8mes et r=C3=A9seaux=20
Tranquil IT=20
12 avenue Jules Verne (B=C3=A2t. A)=20
44230 Saint S=C3=A9bastien sur Loire (FRANCE)=20
tel: +33 (0) 240 975 755=20
=09
Retrouvez-nous sur les r=C3=A9seaux :=20
[ https://twitter.com/TRANQUIL_IT ] [ https://www.linkedin.com/company/3108=
003/ ] [ https://www.youtube.com/channel/UCl45FZItnoOlXsaWUa3UrTw ]=20



[ https://www.tranquil.it/qui-sommes-nous/nous-rejoindre/ ] [ https://tranq=
uil.it/ ]=20
