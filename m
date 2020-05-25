Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C21E14E3
	for <lists+samba-technical@lfdr.de>; Mon, 25 May 2020 21:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=KsghCZOiOSQpTOiV7i+F90MruENq84eGIyKx7DiWjbg=; b=o4oXZYvAEDOjBw5fS1JKa47WJE
	5DjjQ0Hcdlm4p2nWWGJVh9mf4BPVMSeV0sEMnYv9NoUu6BRZGCBykjYmjKKJSl7IUIDR1Ys3W4mW9
	yosBQf5EcG1hw/sBZw5sfE7nlLEZ2kxk13tJn36/+F6bug327QLW8WQToC+o2ydspyYsIROjraYSc
	J9nUBqlTq/f1TcapiYmh/pROqc4XEC1hSgtnN1fD967uYt5T7/ct+GXrlbLqlXWGnwMHxHq6mHenH
	uq58AvK/skKlkdLsZofBxyWi3rd992+0zX2SENc1v8aZmcMrLsSoSS7mSGcuveI+ICy5maYdZOAWc
	4JaX6Wzg==;
Received: from localhost ([::1]:52796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdIvc-005oED-4S; Mon, 25 May 2020 19:38:28 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39341) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jdIvW-005oE6-4A
 for samba-technical@lists.samba.org; Mon, 25 May 2020 19:38:25 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE56F5C0281
 for <samba-technical@lists.samba.org>; Mon, 25 May 2020 15:38:15 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute4.internal (MEProxy); Mon, 25 May 2020 15:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=artmg.org; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm3; bh=Y4sbBNGlVYPAWvEkI8zZAJZLi7SADRkAyGgfaB8QlGA=; b=Foxd8fro
 A8Vz7uMzyYtaUfH1HJ44zMU6/YIubgI0SdXZBmeoxBTFKqvnu7jp+MHoPzGONens
 9qZV2Ws+N6jSe12el2qrRLqSE7TrPkR9mQoP9AmODN5AJl1RhJSI/QudVQk9OcqL
 0niJpSVqjkbtT0LaA10WGGEKucysoK2U2fSPW6QaGEloiuF+YWBTqFRBrM8u0YyK
 ClELm6s7QhEQNXHYbhphnM+c8YsEVCNVJOyP9YiQuven2TbCjuYO+FlHfMamMrss
 iO2pc/cNrDFyDva8w0fixekQDSz1rPWkT0qPIOF0uYQRxBL68E4z6qqwFUPqLGM0
 LmN2GpAzoRvi1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=Y4sbBNGlVYPAWvEkI8zZAJZLi7SAD
 RkAyGgfaB8QlGA=; b=fCd/x+3SWXbjBWLSjUSvVdzDpfK9gJH84KqMmpVnAcFzf
 ssigO8JahOBKI6vYkj3GKObVCve+j8m1/U3Q8lJ6iD5Ujzcn/OOl1fW0mn/m6VSg
 hIYwFEiRXUhOIkoG95twE4a9tPTeFqoYt8PBdpbFjbkMU4L7TtRTb2uNQOsjRBRS
 z6Uq8eUI4iMMHtrT9q2NOKmcHyk7/iTE1ouAN01ClLhzMobM4NOKDz80E+JwpPtv
 JiQGSoKMfEJ/xsx6LaoCGOshJiqsqNtYNIksiWkgRXUQRV9tgNWN43B1jTdXPY/6
 ryxBDoVuq30GDvEBqMN1noBJ843ugcO2zvzvp2ZWQ==
X-ME-Sender: <xms:px7MXsTxpwcButbz3dqIAJocXzqbtr1XVXcoNnFuLhgQO-RamZJ8UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvtddgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesrgdtre
 erreerjeenucfhrhhomheptehrthfoifcuoehsmhgslhhotghksegrrhhtmhhgrdhorhhg
 qeenucggtffrrghtthgvrhhnpeefgefhfeeuhfdvffffuddujeejvedvieeuteekudduie
 ekudekjeeuiedtleeukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhmsghlohgtkhesrg
 hrthhmghdrohhrgh
X-ME-Proxy: <xmx:px7MXpwkXkZp5WBt4YZS2xJ6t2yCfAn8y0UcDjb7pGdqCu39v0zPAg>
 <xmx:px7MXp0WKooKx2wTsxoUPnwl_3V0Mf2WCox8kZQ-fObyUUunG2uKBw>
 <xmx:px7MXgAb3OcuvIBPDiaADtn4PLGhAeNCw9W981frven7tYgHs306YA>
 <xmx:px7MXsR1z8ImpcHEKeUn_Du9cBTvGcrTTd5HsmQTE2AGLaad9wfIYA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 562DEC200A4; Mon, 25 May 2020 15:38:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-488-g9249dd4-fm-20200522.001-g9249dd48
Mime-Version: 1.0
Message-Id: <e48e9a88-99ad-470f-be1c-eecaac8381dc@www.fastmail.com>
Date: Mon, 25 May 2020 20:37:54 +0100
To: samba-technical <samba-technical@lists.samba.org>
Subject: vfs_fruit overflow checks on armhf with large Time Machine backups
Content-Type: text/plain;charset=utf-8
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
From: ArtMG via samba-technical <samba-technical@lists.samba.org>
Reply-To: ArtMG <smblock@artmg.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, following the patch you guys helped me create and get into v4.12.1, =
I got my Time Machine backups working, at first. https://gitlab.com/samb=
a-team/samba/-/commit/b8ef341f6b537ce23262ca191f4f55a6508a0854

Now, however, since the total volume of data stored in the 'bands' has g=
rown to 100s of GB I am getting failure because of the checks on precisi=
on, and I am not sure how to handle this. This is on armhf (Raspbian), w=
ith the vfs_fruit module =E2=80=93 the issue occurs in ``fruit_tmsize_do=
_dirent``where there is an overflow check on the calculation of `tm_size=
.`

	if (bandsize > SIZE_MAX/nbands) {
		DBG_ERR("tmsize potential overflow: bandsize [%zu] nbands [%zu]\n",
			bandsize, nbands);
		return false;
	}
	tm_size =3D (off_t)bandsize * (off_t)nbands;

I get the error "tmsize potential overflow: bandsize [8388608] nbands [3=
6980]", failing because the overflow check is based on SIZE_MAX, which o=
n my machine is 32 bits.

Checking if size of size_t =3D=3D 4 : ok
Checking if size of off_t =3D=3D 8 : ok

However this is an unreliable meter of overflow risk in this case, becau=
se tm_size is declared as an off_t, which is actually 64 bits as you see=
 above. Unfortunately, to maintain the overflow check, I cannot find a r=
eliable way of encoding OFF_MAX. Also I fear that LLONG_MAX might not be=
 a reliable on a system where off_t is only a 32-bit signed integer. So =
I am stuck for ideas of how I should recode this to allow it to work for=
 me, but successfully avoid overflow when compiled elsewhere.

I welcome advice from seasoned contributors as to the safest way to patc=
h this.=20
Thanks, Art
