Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE842C5CC
	for <lists+samba-technical@lfdr.de>; Wed, 13 Oct 2021 18:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C80b4MoefGvw8h7qsO2njYeYgSV40S8pQwIbqHYXaDU=; b=ECj5UiEiMv3j10leiOOtmUnPSG
	Qgv2loukHv6iXrpNVicNbqCY0x1SLCFLGyD48za28e+LLEHVu7nNrhH1Ab6DRwILEXnsLOOnC3OCg
	EoA2hrCeCpQOqAYZUo10H3R13Yl7yTn8gIdeeKTtjkIVQQeJEQXn/9lfS+GTvRB3vajichEc4gwxA
	QL+dgNIA2MvbaJfDQf7vtJbe2yPEDqmr5cl3V6u2OEwRv6RyXoK1uQ8cMaK/HW0pkzZOrV0JMTdW9
	/Km193GnrDOva1JomUFQcxv1NW9ib/BSIgn9J9wuPM3K+qyJRcA+zgoWlRxJYSGnuRLZ2dRjtfZS2
	+LVd44VA==;
Received: from ip6-localhost ([::1]:45894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1magjr-007Mhg-05; Wed, 13 Oct 2021 16:04:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1magjk-007MhX-Ui
 for samba-technical@lists.samba.org; Wed, 13 Oct 2021 16:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=C80b4MoefGvw8h7qsO2njYeYgSV40S8pQwIbqHYXaDU=; b=NO2aTTYMWQAr7b0zxrGDRwwZl8
 4agpK6tzqErxTgpW5du5miQFqrlVZmT2muomrPizOKmlzW8vIxSdE0id2hOrh7ShcRggiejs1E1x3
 znsx1Y4RSAdOPHEYPUiTO+R260BKWb3niOFOMTLQaNTJ0j3jQDiI4UYFNnYX/UB1b0I1uJKKViF4u
 s6pvjqVKwXqNEdCwbzoPCyw38+slWR/g3h6Jbn0qi9mmedB9xXE4kA6lCrNvBfQKlUPMkCgIdDFli
 PDOvF1tZlYKbFckkZlrybqw1hk5hlaPJGb4OwqS4gM4vTcVJEozOxCdjEqEP0xvWJyY/SSK5nyh0q
 om00rLst7wrBKhbaoVOLQujBjZvbLj8yYN2NleBZcgc6ROSkbCPou+qmdy5VA0xr+u6otSBba4YLj
 ECrMGmgggwfkH9gD7qNf05yXcKK2S38y7SxE8Ia72WB3rRiNyPQwUGNlu316WsG0SfvSySZAMePbF
 HTim0zBIW7ws7gOokDuhkR8R;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1magji-001BJE-U2; Wed, 13 Oct 2021 16:04:10 +0000
To: abartlet@samba.org
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Wed, 13 Oct 2021 18:04:10 +0200
Message-ID: <7009830.Vje2UjyrXt@magrathea>
In-Reply-To: <E1macwQ-003K2q-0I@hrx0.samba.org>
References: <E1macwQ-003K2q-0I@hrx0.samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, October 13, 2021 2:01:02 PM CEST Andrew Bartlett wrote:
> commit 7857e1249b72be8c8841b99cb0820c9c563178f9
> Author: Andrew Bartlett <abartlet@samba.org>
> Date:   Tue Oct 12 07:55:54 2021 +1300
> 
>     .gitlab-ci.yml: Honour AUTOBUILD_SKIP_SAMBA_O3 in GitLab CI
> 
>     GitLab CI resources are expensive and often rationed so
>     provide a way to test other things without testing an -O3
>     build also, as this will save 9 jobs.

Please documented it in bootstrap/README.md

Thanks!


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



