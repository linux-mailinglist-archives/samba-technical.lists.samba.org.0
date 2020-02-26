Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 547AE17069B
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 18:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3mvkGu0Qm+IGXW3pn8aBDy+oxQxtQvfuiY73sGIb8Eo=; b=XaSRyQI+lxiDG/KVIA9gp5spNz
	c8tMFimUVzYpGU9Eyjjz2s6Vi/n5WLOnIsJBbE8HAKJTh+cr6rAVHZVKHdiaHegtS0OlK4AjhxBp+
	HE8AS5lcy4nkSBAlB0gvNXLLQvNwjQ15hmLV/cJe6ZcYIpNCbK/2AfI3THOK9/xBsr3NwOVGL80PD
	BbqcWRya1rNfLxpd2Aq7OAeW+GKRQl54uPAMVuQNnmUKEsk38wp1cPZ/XXid9Z1C3p0hts3GWeqEq
	W7rjPSd9c3s/rjKcU8lMlk9wnc/pMPXsNQ8Wv4lPoHTzCxoEIEXTsiIyKRs1iC5vKlLGaHZhQ608t
	5a4UmpzA==;
Received: from localhost ([::1]:23620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j70pe-00Bpx2-7Y; Wed, 26 Feb 2020 17:50:50 +0000
Received: from mx2.suse.de ([195.135.220.15]:53416) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j70pY-00Bpwv-NW
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 17:50:47 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4834CAF37;
 Wed, 26 Feb 2020 17:50:42 +0000 (UTC)
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: Anyone seen SMB2 signing issues with Hitachi HNAS?
In-Reply-To: <CACyXjPxG-_MQst10GR61-A4LNe1bg4LE9NRCGH3myX=hSUN3iw@mail.gmail.com>
References: <CACyXjPxG-_MQst10GR61-A4LNe1bg4LE9NRCGH3myX=hSUN3iw@mail.gmail.com>
Date: Wed, 26 Feb 2020 18:50:40 +0100
Message-ID: <87eeuh44r3.fsf@suse.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
writes:
> Tried connecting with smbclient and on the Session Setup response,
> which is signed we exit with "Bad SMB2 signature for message".
>
> I tested against a Windows 2012 DC and a capture shows that the DC is
> also signing the SMB2 Session Setup response and smbclient has no
> problems with it.
>
> Is this something broken with the HNAS?

* Signing key generation changed between SMB 3.0 and 3.11, is the HNAS
  using the same dialect your 2012 DC?

* Signing keys are generated based on the Session Key (which comes from
  kerberos or NTLMSSP) and it uses time as input. Maybe check the clocks
  are not too far off from each other.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

