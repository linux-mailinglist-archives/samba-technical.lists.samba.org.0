Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD791948C
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 23:22:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=ui3J3CmUJHGSz9xovmMVRYY2kKCsoSTKKxSt//td0Jo=; b=K9bPegigRDmHd9PLB473NJS7c/
	+fkTei8mkK0YPXD5KAneOvJeAioYkuRNrMgdm/JCABFAn9fcnLu6Kf/OfQ3i1GBllqs87KwGTXDNL
	gK2xFMtw8c+/eazIPbpbEwNM/QdfVeevSLb1Lb8QzecSM8Ki5Lf6W1x8wEXNk/zmlayBv0McF9T6e
	gCU/SoDl1nzinPfhmp1G41uLxHs7pbQNv54pFe1y0fJkDgheKUBmLD1mNEVPHPZ69fSJRqhxcGDx9
	0K4dhPMEgOILYC3XZblThBuE3hU4NDJACFhpir1EQBDaFa0dcqqSlyBwyWLb0e+cPeQD+AbEE20Ap
	nF/pijnA==;
Received: from localhost ([::1]:57604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOqUZ-0036qn-7V; Thu, 09 May 2019 21:22:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:39026) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOqUV-0036qg-51
 for samba-technical@lists.samba.org; Thu, 09 May 2019 21:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=To:Message-Id:Cc:Date:From;
 bh=ui3J3CmUJHGSz9xovmMVRYY2kKCsoSTKKxSt//td0Jo=; b=oiPRkA9LSN0+AeLO/sz3/O5MBl
 EWoN9cZzxPy2k1taCE7LU0Lw+P3zJFmbR9GdFzY30e2/e1fLgbiODYRZMGU9S7XGyz8V5/kvuOs9f
 dK2yJKQQwvQA/Bcg7vUVNStdEJ7mx3CxEvjgGYwIt71FNUNFdHjoRJen0gFKJZS/nYcI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOqUU-0006VB-K4; Thu, 09 May 2019 21:22:10 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: recvfile on streams
In-Reply-To: <20190509202623.GC205240@jra4>
Date: Thu, 9 May 2019 23:22:08 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <1802A8F0-83AB-4790-8E32-C8544166206A@samba.org>
References: <20190509110446.dad2siv6vvosl62z@inti>
 <20190509202623.GC205240@jra4>
To: Jeremy Allison <jra@samba.org>
X-Mailer: Apple Mail (2.3445.102.3)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: =?utf-8?Q?Ralph_B=C3=B6hme?= via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ralph_B=C3=B6hme?= <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> Am 09.05.2019 um 22:26 schrieb Jeremy Allison <jra@samba.org>:
>=20
> On Thu, May 09, 2019 at 01:04:47PM +0200, Ralph Boehme wrote:
>> Hi Jeremy,
>>=20
>> I've just filed <https://bugzilla.samba.org/show_bug.cgi?id=3D13938>.
>>=20
>> What do you think?
>=20
> LGTM. But it also needs fixing for SMB1 (sorry I didn't spot
> that initially). I've uploaded an additional patch that does
> the same fix for SMB1. Please push if happy !


ah, drat, I tend to forget about the SMB1 code these days. The patch has =
already landed in master, I'll push yours as a follow-up. :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


