Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C82517C3
	for <lists+samba-technical@lfdr.de>; Tue, 25 Aug 2020 13:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=mHsDQz103QqlKcWr0hVQKxCx1KJBKny2Q9hzDQVHBxs=; b=Hzzcl7D7FI/NbDTUs3EWvsQ9G8
	60m7cFXjTR9BdYPdfnYmkg5orfL/Eyo7I0JbL3tyWMiKbuvlLlXO1veHvwMB4IcUm8AE92Yib503X
	BkXjQKqe+oYS7Hw7C/2PJtQQ+5kaE89Aoc07w++U3D6rnTAaPWdXEadwOrFgXnliFRf+f3ven+owb
	hZ/imyfGYNyPTs/UYUN0HYdcmBegXFzcucJzYlNOTs8FcIivckwxTKJ7qdVz3mHYAD0Nw6tYTjA54
	Ucocp2LCIfiCVn59gNrSmLY+EC/3CEMhhvHLJDZjJZpilvrgPBuV1+a8jImvRUiG6iauMZlxH6tWR
	Yey/7gzA==;
Received: from localhost ([::1]:24268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAXG8-000S0Y-0B; Tue, 25 Aug 2020 11:37:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAXG3-000S0Q-0u
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 11:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=LjHd3TlsIppF9wBHE8B16BW3bCDO/PEedCj7TUHB8tY=; b=CsGVI5yymcRLd3Q4tpPjBhFXyX
 l0ddUzK1XPCshJFF/eTZ/HCY7FFRfHFWDF6i23IYz7BLfenqWyTRIhoV3ODt0+X74Yk7kIkPyAvnB
 R1qD3mACL2K4crPEux7VPw2UC9PXmvX7qaMEq1GuDCaVTHVw7cDTHck6sw3eRyAlGjb9YNawMv2Qu
 Ju1pdgHP/b/tz27urJqUqdBCoibEf3Il+PfbhmYc3SZcOJ08WXT8i8lL/sR3HDVER3V1vL7u0G3Hw
 /hfKdDdhwyJHienlic7WwvJv4gaXdUl7kgKR4oCCGHuwSvlz5visGv5w/SoU7b4cWn5gQVt05K5fG
 HdBTpdKJzYynxSuKI6G0lfsN961lq/dfjeHQvKpTrVIf0SqVkIlWISDnLum9U79mEzx0NY7rAGPlQ
 /2nFZIm81a3uuVvnoUz2ugUfwyAnKJ0Fg+/mjkyIANwHQ7YL2H+bMsyPGMiAvHeNVsWSKuC2EIA0I
 ShnOejZehlzNiEd41Je9bhMw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAXG2-0003uL-PI
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 11:36:54 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kAXG2-003ZWQ-KC
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 11:36:54 +0000
MIME-Version: 1.0
Subject: Re: check_ctdb: return WARNING when no script was run,
 and fix scriptstatus split
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-191@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-191@samba.org>
Date: Tue, 25 Aug 2020 11:36:54 +0000
Message-Id: <E1kAXG2-003ZWQ-KC@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgc2F0aGlldSBvbiBTYW1iYSBHaXRodWIgcmVwb3NpdG9yeQoKaHR0cHM6
Ly9naXRodWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvcHVsbC8xOTEjaXNzdWVjb21tZW50LTY3OTk3
MTU2OApDb21tZW50OgpDbG9zaW5nLiBJIGRvbid0IG5lZWQgdGhpcyBhbnltb3JlIC4uLgo=
