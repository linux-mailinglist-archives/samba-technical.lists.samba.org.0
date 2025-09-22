Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825BB8F8CF
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 10:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=hb9I7s203+vUDCxqk3bg8ZhYx+MmcR7AiIREvfhk5zY=; b=rkl26VV0ZmuFRSvykQVRktud0Q
	EtXPJpLOigka6xlW1SkyZ6GrIKO7U/AKhmzq7g9bRc+f2CU5+OBvZ2czGLe89a8T5dkv4jjX7Wmu8
	Gvq3mTEzcrwFE/0BkPgv5XpGCsjUxQga3CY/IRPrvA8N3xTOCoxknaMVjxxSlGSkjKWQTceOt7aqr
	c9W7DazWKNfLYOf+ZuxiNOsKO3azAvpOAHVZ5h31kOOIWiMRiLFvqH7eGqiRvjDnlcOhRA2qHjoXs
	60eAecHqRBZKBejqGl20+7r6Cz8vl0oOsmJDtTV211JjiU+Ix+E68f+JtK1kWWcRe1GFgHl2r0l2T
	4OWCFyhw==;
Received: from ip6-localhost ([::1]:51030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0c0d-004Wk6-KT; Mon, 22 Sep 2025 08:34:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36368) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0c0Y-004Wjy-V4
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 08:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Xry0lYjoGyOZUHr3mU7po9FHIayLjOijTDTiri5wqMk=; b=Ou3OMkIU6aj+ZasSMrAXuODlYn
 DtNLb4NReDadd6lKs6MvtOE5coixK/lqJA4qstE/qEXaMlcyye8wO7g00h901cknxwL1vCRXCRebG
 ZFY10fRKLug2RhRdT9bWPh6I064A8WuuLNb73DDtHGR+QBQ3wDTTtmKmWuV6C1pi7Za81+pUmiofG
 zxOSFGjYM+knNkj84XmyG2rUPWjYtIzI18QW7kidXRIDkB2CHgP8gAOmLFxCJ6nUlkzmpnHNMQEFn
 qvkRU/doVcyiiyfJZRtXxGE5l1P/y6883G0yOl01cP7KbA0vTDrrK7eaSE8joOutnhGYdLNj/QaCN
 su8x+DusWNDpIjzNLILUFzTnT8Ia2Dgm77tb50xST6NUOo6QMXTYrE+0Uf5cIvgMPMJUM/gY4gpRV
 08uUpp77vNbeenHo7Xv9xSrET09ap9Lu7SO/iZToSmxo0avcYDVz7guqVkp7ntubKArHThAAlxNbq
 h5A1Ls4SsxWVASnChRoGGP4s;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0c0X-005Lvs-33; Mon, 22 Sep 2025 08:34:50 +0000
Message-ID: <345d53679a0d41e1c930f37422eca0959eebbee7.camel@samba.org>
Subject: Re: Proposal to change smbpasswd file format to address Y2K38
 coverity issue.
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
Date: Mon, 22 Sep 2025 20:34:46 +1200
In-Reply-To: <CADrT-m+wq8m42JjDt-eAZrMFqynz5yXKHk9q5ksUxiHew75Dpg@mail.gmail.com>
References: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
 <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
 <1afde102d461529cb041d96e448b9d2d3f6fe836.camel@samba.org>
 <CADrT-m+wq8m42JjDt-eAZrMFqynz5yXKHk9q5ksUxiHew75Dpg@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2025-09-22 at 10:55 +0530, Vinit Agnihotri via samba-technical
wrote:
> Thank you Andrew and Michael for your valuable feedback/suggestion.
>=20
> @Andrew:
> Although this is true, I believe if we are to change this, then we better
> switch to 64-bit time_t, else someone has to revisit this after 80 years =
;)

The smbpasswd file has many other limitations, 80 years should be well
past its death.

However, I note with more worry this in pdb_tdb, for the default
tdbsam:

/* times are stored as 32bit integer
take care on system with 64bit wide time_t
--SSS */
uint32_t logon_time,
logoff_time,
kickoff_time,
bad_password_time,
pass_last_set_time,
pass_can_change_time,
pass_must_change_time;

In short, I think we should do the very minimal change for smbpasswd,
but tdb_sam should probably get a better fix. =C2=A0I'm still not worried
about the code running in 80 years, NTLM will be more than totally
deprecated by then I hope, but there is much more of a case to fix the
default backend properly.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org

