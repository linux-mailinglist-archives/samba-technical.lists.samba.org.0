Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C071A02C3F
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2025 16:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XCronn/OLayknoFwGTaEzoQnoS0LqR10xu5kVOG4usA=; b=OfgI1P13+mUjDM5Xy1lQakTjyX
	jlkEgNqwrm/PCEvRmHsPmKrpkRdvbeogC/yJ/UsNwaK/UmgDpjnS8mmt8/trQBpjgrl+NkYok3flN
	Ai9Z7K/3eV8gDWwa+7HmTpg9+SfiBYA/IYqAZBzUz5u/Fx9WdZv7whmAWR1jBloN+Gykqg3S9lPmZ
	uAN126EPllbJEDUP2xLs7TV7GEhamoxQ+GAQ0oF5ZygHHTQBqB1xUZJp0sA2HgE1zQEe834yQA61E
	pGZSmJurT+afE1dtOteGV2KlJ5cCiehv/UVCbS1w3p7OA/KpdGw6oW6+oE9hYnh+1We7xKczWa8PH
	eErcnqGw==;
Received: from ip6-localhost ([::1]:57840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tUpOt-007PA5-Jt; Mon, 06 Jan 2025 15:52:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23034) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUpOe-007P99-Kb
 for samba-technical@lists.samba.org; Mon, 06 Jan 2025 15:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=XCronn/OLayknoFwGTaEzoQnoS0LqR10xu5kVOG4usA=; b=HQ1EcNSsPiW5FFWTgnVuj1MJ6s
 Cqh74HiyCq2jQGanceMY7LN+CFeQQxMMYhzxc6oXUNUJmoWCy8bm4IbM1r1irt05ILrLPqlTPileF
 MIQW/ub6rJKiQH2mbOgTlA7etvrCuS53H5JJTG51IAKzgJb4wkbBCUf+1hcr1kjEdBdpNjmTPVP+i
 br5eYCnUBbhnYM0JCfwP5fX5GiAL84lnHUraLYFy/vGuxEAzPg0Q7HwK6YllzueP1h1zfugV1y1m/
 FrQ4y1ORXMcbDOBJJXSgu+VvYKPEm0myU53dw49kMKHpxQiAupzozvb+a62zFE5D15fXkW6GLUtp8
 O63qe6lNU9eYTmVIvHfO8Mq5QD03TeVXpQZQwkyE8lHCye4/1onZYOoFoWy5/KWa3EH+CcDyYJWxR
 dxRGGI7a2aeYdqj4fWMCQfUsoKlbYAREEHYYsZUXq9oM+TNJ3kgawRCuxzMffBItcXfBO7+gOXblN
 L+i33ILtEzkLQJvw9R3ZjXOu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUpOe-005YU7-1P for samba-technical@lists.samba.org;
 Mon, 06 Jan 2025 15:52:04 +0000
Message-ID: <6255cf5f-ae6b-4133-bf34-99485af939c0@samba.org>
Date: Mon, 6 Jan 2025 16:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.21.4 is scheduled for Monday, February 17 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


