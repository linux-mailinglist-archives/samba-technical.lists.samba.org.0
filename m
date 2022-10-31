Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51294613C33
	for <lists+samba-technical@lfdr.de>; Mon, 31 Oct 2022 18:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3mUaHoeeawRJFDa99RHuzmZQPWtr64SBvlr78DtKSfo=; b=RxkUzn08a2TXY5960+VvLldHd8
	F+40nEj7dRaZSuAee33xQVkmRQbofQbefEAOgTvJKseAbm+VDYhdmCqpTKdi8E7AWf8e5PfMDOYK2
	PiemCnfxxku+70KFSkv315k9xt+8yTn5njGLc4aIXZMwiMtV51BLIPKQiqa6KSr1W0aECR/Eg8tYC
	tR+MfZepzGpNl3+x9F4uti1WEdSs6KFq9t/ZW1XHeOOSDjNFe+W/moKrdi0NwzDeRP+m2ZgD5Chyp
	CzrFNiCVrPXCyxGEGL7SsSZyugbw6vT+867f1pmbgpVizArZAQXNEufQjl941wszaFkh2N6oNr6aw
	6MsQIwSA==;
Received: from ip6-localhost ([::1]:37282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opYcs-007r4O-Je; Mon, 31 Oct 2022 17:31:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opYcl-007r4F-RM
 for samba-technical@lists.samba.org; Mon, 31 Oct 2022 17:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3mUaHoeeawRJFDa99RHuzmZQPWtr64SBvlr78DtKSfo=; b=rtv5yClWbu+/WVBRfb85YQmjN4
 xSTAIxJfN+EhKUzF6LstI4ovFN8I9Y/2Tb8KSdikRwF2FxURgAQ9oUJzZb7GS2bnRLbgB4NGYgtcM
 L8u9q7A7/GCy9OVcPpA9wPurbyAF/JQio5b/cptN+KrW2b3WTqZtOSbP7QPZ9mKiK+gePSWUsFzc2
 tm/gYC78Sjl1idBkVSDT3YDb5J0E6us6DJWZT9OfCBk8F2r8Bywl/cETKaD9Dc7/5q6PXdeYnwHAb
 vscXLIWEC3h3TXsM1ri3BO0eTkazT1g8xhAy7CdH6DpPerEA7BnU9nO8eZUrEA7CtebijnRQKgEuW
 XtOOKaVOO04fBSWY8q9L798tuaFDG8cXmNeW84r/x3R9luWyCecXh+r0hrBTooEyW6qm2aA4P+aWh
 oKe+QUP2bI70QJbhKw4u2+EQtAoQNTWZ5mkvzoaCxo+npjUZWj4Ply6RrLy9GvfHecEPsg+tT9WSv
 wrffaLLWGdjSKjsKHOChnWWL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1opYcf-006bVa-ST; Mon, 31 Oct 2022 17:30:54 +0000
Date: Mon, 31 Oct 2022 10:30:51 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: garbage file in sources: source4/ntp_signd/ntp-dev-4.2.5p125.diff
Message-ID: <Y2AGSwF2CuhEmoTX@jeremy-acer>
References: <b72a0362-10b9-866f-031e-4263f05263b8@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b72a0362-10b9-866f-031e-4263f05263b8@msgid.tls.msk.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 31, 2022 at 11:26:39AM +0300, Michael Tokarev via samba-technical wrote:
>As the git log says, it's been there since 2009.. Is it a time to delete it? :)

Submit an MR please :-).

