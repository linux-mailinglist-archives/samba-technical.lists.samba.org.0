Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4E324C93
	for <lists+samba-technical@lfdr.de>; Thu, 25 Feb 2021 10:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R3A0OYO+A4Jhz+fr2u+mfG6ww+/cdLvaGAqE/xnvF3s=; b=rGRCNb+phOBesCqNYypFTpkkOo
	0D93h9oJpHQZlPYNb3bmb1jlQ+NW4HdE4mU4XMvA/jsHO2TeFUKPLSL+2fqn63xZDILxLIqxJ/tp/
	ucuFSddXKBsvfUQJ0mF1u5a3Xa45fczdErp5KiVhIfDKV4+g3m5ICRceIibwV5ozCnUUYVHlnQ/l9
	gm0iQZz3+bycP+FvfjDksJI9kd672EWztM22CoStowXgQeptGGUJpMykDa5zkVk/W77S4qIPf83Ne
	REm4pF4bIE/nKlOkp2e9gYeIRSJPA9xkYcLEcf79CNLnl3tuPL3q32qgG7uf6tViE0Pp0oT17/XGX
	2suA20WQ==;
Received: from ip6-localhost ([::1]:39576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFCmu-001JsA-9E; Thu, 25 Feb 2021 09:18:24 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56723) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFCmn-001Js2-Nl
 for samba-technical@lists.samba.org; Thu, 25 Feb 2021 09:18:21 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5DF255C0074;
 Thu, 25 Feb 2021 04:18:11 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute1.internal (MEProxy); Thu, 25 Feb 2021 04:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 simon-taylor.me.uk; h=mime-version:message-id:in-reply-to
 :references:date:from:to:cc:subject:content-type; s=fm2; bh=R3A0
 OYO+A4Jhz+fr2u+mfG6ww+/cdLvaGAqE/xnvF3s=; b=N+eYuR1tUs8vki0Y4S3Y
 CVPV5QvUIHBGwGR0c+FV6OGs+V7YiKgRmsIAz2Bs2mQO38vrGJp3fGCxZs9MrbSZ
 eND0GIJD/GEqKsNFOTyRs+XzxpMoV8chtpc3HBs+MpyZEQCbqhOXms++Q7svDWe+
 MCvTNSNxUYf91LSiV0iugIB+PhXIThXGP/NECfaTWW4yBnQeYPSvZafkT8Dx13TK
 wVE5OQ4Ts1x48vMytmhex03G+F7Tl9motSN91++W6QJn24E1fJgROXQKXJOqr61m
 IAZs13nTl6eH1SerBdCo6UebBl4BVA/+/c9/kNuY0kWW1dG1/6IchrsgDzKqKFMX
 0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R3A0OY
 O+A4Jhz+fr2u+mfG6ww+/cdLvaGAqE/xnvF3s=; b=OZAr6DG8mSVdAuiGwSAZG7
 A57Ie19zd0YI0LeTOrHb6Ndjb4Fxv8vrtA3hj3Y313HcooPqzqb1yCq28RicStZ4
 uEB8Uiv2TY8qsDQs3STVMOHFxmfvZ5CjI0+wBkdYJsR0U2/4PH45lQ9tVgrfjnOn
 tOcDKhlWJZvYVSujUfwGe/OjlgtsFELx3ZtFZlkz28D+pWgbMytuKU69wvKXur1+
 8xurbGp81zZRx6JvUUNENnXkpak90EUTd9mdjJd0UyeKOOR7/rY3qBz6rndW+biF
 EwoTvQdUhU3jyMzrA1goW++YdAylrymMwUwzoU4/Zy+tDO2qAEIJpkdzOmN+69ug
 ==
X-ME-Sender: <xms:Ums3YFZZLRIL9OTKRmzf0wlbXVgcD3hhTmuozdVkvNxc5WsPQNk6fQ>
 <xme:Ums3YMZp0LJIBREGci2FhWa0jbNyyi8zby81tP6bhtpGj2c9WzIgoLvuH9kzuj3pw
 nKsyt6NjrWB99CYEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhimhho
 nhcuvfgrhihlohhrfdcuoehsihhmohhnsehsihhmohhnqdhtrgihlhhorhdrmhgvrdhukh
 eqnecuggftrfgrthhtvghrnhepleejvdeutdffudfghfelvddugffguedtieekheehvefg
 hedthedtffdvteetueetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepshhimhhonhesshhimhhonhdqthgrhihlohhrrdhmvgdruhhk
X-ME-Proxy: <xmx:Ums3YH9FrY8bC4Yx5r8hOdP2ccuMpXzGtZ8lx6at7UL7vW6eFYdqWQ>
 <xmx:Ums3YDodLlG4Jo9ASO_MOdsbVSb69ZUqk1WW4w5z4ycy--LYCCZdew>
 <xmx:Ums3YApSoHiuk3ios3QHT6NR1FR7vKVeqnJSaU7RBccf4SPPnk0znQ>
 <xmx:U2s3YNDV0XUVHPi9vrHvm89vgQg9ghQ1YbLmSIspwVQPcfZqoaZqNw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E6DEF130005E; Thu, 25 Feb 2021 04:18:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <cd9f90aa-53f0-43a2-9683-b5730d01ca90@www.fastmail.com>
In-Reply-To: <CAN05THRTEXjZ+TQB+X2kA_i8CgKctBDB1UhbifAu0WzqHOuNmw@mail.gmail.com>
References: <0736dea6-ab54-454d-a40b-adaa372a1f53@www.fastmail.com>
 <CAN05THRTEXjZ+TQB+X2kA_i8CgKctBDB1UhbifAu0WzqHOuNmw@mail.gmail.com>
Date: Thu, 25 Feb 2021 09:15:59 +0000
To: "ronnie sahlberg" <ronniesahlberg@gmail.com>
Subject: Re: Using a password containing a comma fails with 5.11.1 kernel
Content-Type: text/plain
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
From: Simon Taylor via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simon Taylor <simon@simon-taylor.me.uk>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 25 Feb 2021, at 7:37 AM, ronnie sahlberg wrote:
> Hi Simon,
> 
> Looks like the special handling of escaped ',' characters in the
> password mount argument was lost when we
> switched to the new mount api.
> 
> I just sent a patch for this to the list,  can you try that patch?
> 
> Thanks for the report.
 
Hi Ronnie,

Thanks. Your patch resolved the issue.

Regards,
Simon

