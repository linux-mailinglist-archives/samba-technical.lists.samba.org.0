Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FB26AA21
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 18:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Y/AS4QEx/gg0+2xFJ+Tho12q1TtZwwGXYkdpaSGXXJQ=; b=tjohHJcGBkACyTXPuEoN98Y+nT
	sIejzgNRb5H9LneBjGgIIByGkM+pmuxMuwR79nMD+kTdrH/BPfxdJE0THd3SXBgdPFNknlfB4ndMJ
	DxLHaiJV9to9zNLMDKIpMsdSumwpicTfMlxUS/4qZC0EDYxpS8bcggE0tnsZzg21MruG7/p8W951l
	TtZIkrGTYLLEojkyGaGt6F52bZ7hLokhvtM1qtl7nKAI3kdE5BiKXdBWcu4O7rKaRS3Ir1H3TFFVr
	3z9zjlpYB84smTXMsi5jM1Xm3akwQKfVwPwP2e9Y9QRpzWLbM4aD7x+U3pakX/V9B3GdpiKLoz0oV
	G9PJEzSA==;
Received: from localhost ([::1]:40706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIEFe-005XEi-4j; Tue, 15 Sep 2020 16:56:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11236) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIEFX-005XEa-Ix
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 16:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Y/AS4QEx/gg0+2xFJ+Tho12q1TtZwwGXYkdpaSGXXJQ=; b=Lzqirs3696L9z2RuD2j4HnK4cW
 96eAKW1RHUm6I1iD0P+yyVmHarTOXFxK7EPI4FqM9j/gLf0QDPt0ZRCZYI/dJjdatgYQJ+ENKl6Fn
 BjBJR8hgKA279W0Zl+Y2yLg+z3bz8e6K1lX3cwskX5Ws+d3aIEgBI9Yz0LkkfcP3EvHewCiK6dqKL
 kE+EIMefWU1Afx5NoZlaVb5FcBDQfjoyaDv+RI7rodtg+fp44oMYZRhSbNNM1J3VZe8AAv2S0PGve
 s97TFlHL8RlyHmDvbC3nW2Tp3ls/UCnms3FMupcEVk4DQDXvkwHOpmyqdtu6QFCYTR9OYGPpMMyOU
 hj3cU1ZjV4Qz0IhgJkbsfH8FTvDd1S3g25RFtci/73x1sn8gElHxl5kI+3bcjJ837SDxElo8YhRqj
 nbmLWTHpeVTMXUplfcAEyASq/GeB6kY+g4xoMQp066QTTGOmKUlrbcSJZShybGhenEbQOiTbM1qw1
 koazYct1rFu8JzezFAUf78lo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIEFW-0002Xu-4m; Tue, 15 Sep 2020 16:56:10 +0000
Date: Tue, 15 Sep 2020 09:56:04 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: SELinux attributes in Samba domain
Message-ID: <20200915165604.GA305502@jeremy-acer>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
 <390168ab-7835-5750-cfca-3327596618b3@samba.org>
 <20200915145247.GF23377@pinega.vda.li>
 <597958a1-3c75-8ea4-cf8a-cf9c7a4e76ad@samba.org>
 <20200915150621.GH23377@pinega.vda.li>
 <9fe16073-86d7-0828-7ef0-87832d0f80fc@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fe16073-86d7-0828-7ef0-87832d0f80fc@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 15, 2020 at 04:56:51PM +0100, Rowland penny via samba-technical wrote:
> 
> This thread started as a discussion with regards to Samba and sssd, it now
> seems to have morphed into a 'how can we improve Samba' discussion. I

Which seems IMHO to be an excellent place for it to end up.

At least this is something we can all agree on, so let's leave
the XXX vs YYY stuff out of it all please :-).

