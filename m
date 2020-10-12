Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9B28B1C2
	for <lists+samba-technical@lfdr.de>; Mon, 12 Oct 2020 11:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=znID3Yp0OfR3dmXjA/b3uU1xhv9pYAA6FAm5lFz4kww=; b=5NVIhW+3R3NleWYK2Js6Grb+67
	9oCBd2Go0u8neC510xHTdlqilIrrVuEHi3SCpOiezJrhWDfn9VCO1YK/W8l+e0JhQxf5OBzLBuAkv
	svzo4VqnEHSgq2VYQbSbYTDnAgDD/f+ib2CczycwLH1Ss212lXloa712xus/WKMxU5mIIukPSMVrP
	SX2VbY8S4XCkb4aG2ZapO/60IypgFAPvPecuRF85dOc90v+XnFLGPN/ETCh3zAeMZLV5xJL4VCAj3
	zNMUqa5SkzZvr5kTanuMy+jSqWLh9PnkZH+v12qcBnTv05Go4LFm6ghdhilpPrDRqd7gmecxElEuf
	+S2pL7EA==;
Received: from ip6-localhost ([::1]:32930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kRuTR-00BiXt-Fq; Mon, 12 Oct 2020 09:50:33 +0000
Received: from mx2.suse.de ([195.135.220.15]:53626) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kRuTM-00BiXm-9u
 for samba-technical@lists.samba.org; Mon, 12 Oct 2020 09:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602496225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znID3Yp0OfR3dmXjA/b3uU1xhv9pYAA6FAm5lFz4kww=;
 b=Z5k4XGUSGqc2F1wrXMswb8PEkChTI+eFnBFLZhqWA2EXfKz8iFrT/StKBXQzf+ZHJDi4VM
 q8/AJR4rKxfZkYTd+JZoR+DGRl6CvPz2rBrFaTlzg2XE9pa87S8CXvU6v+7YdPZ3qZbb4w
 OVyLcgrfb8YHKnFJi8/cXNE/NopFOEI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B766DADA8;
 Mon, 12 Oct 2020 09:50:25 +0000 (UTC)
To: Stefan Metzmacher <metze@samba.org>, Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
In-Reply-To: <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org>
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org>
Date: Mon, 12 Oct 2020 11:50:24 +0200
Message-ID: <87r1q3hixr.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Patch LGTM

Reviewed-by: Aurelien Aptel <aaptel@suse.com>

Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
> This isn't in MS-SMB2 yet.
>
> Is this AES_128?

This is returned in latest Windows Server Insider builds but it's not
documented yet.

https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewserv=
er

I've asked dochelp about it during the SDC plugfest and they gave me
this:

    The new ContextType is:
    SMB2_SIGNING_CAPABILITIES 0x0008
    The Data field contains a list of signing algorithms.
    =E2=80=A2    It adds a new negotiate context, which enables SMB to deco=
uple signing algorithms from dialects. E.g. if both client and server suppo=
rts it, a session may use HMAC-SHA256 with SMB 3.1.1.
    =E2=80=A2    It adds the AES-GMAC algorithm.
=20=20=20=20=20
    SigningAlgorithmCount (2 bytes): Count of signing algorithms
    SigningAlgorithms (variable): An array of SigningAlgorithmCount 16-bit =
integer IDs specifying the supported signing algorithms.
=20=20=20=20=20
    The following IDs are assigned:=20
    0 =3D HMAC-SHA256
    1 =3D AES-CMAC
    2 =3D AES-GMAC


I've been CCed in a Microsoft email thread later on and it seems to be
unclear why this was missed/wasn't documented. Maybe this is subject to
change so take with a grain of salt.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

