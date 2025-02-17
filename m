Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F02A388C8
	for <lists+samba-technical@lfdr.de>; Mon, 17 Feb 2025 17:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=tzXHjpwPfAmcoal1c0JhFY+a8FRPM0fRKNDrRkTutQA=; b=YOCv1+z6V+Y1ks1ehurdpx60fU
	kGtNQ8YXh1/rKtzUOTSgZVlOrCpOO0XaPhTrx24z/JX4xyl954aKQ1kAsHPsh+uxJiq6dw6MdKI6P
	hgssPYQoAtG7tPZFiEP8MtwQteuQpBgcnbNN3RN50qXlaAj7TQz9/O/rnRcelo9R/nL8wmv+9gfAx
	8bbTMV3SP+JX7MtkkYDNGMg0ahQPY4iDcmzVw6ys0t/gJ4ths/xt9sI/mzcQhBLbB+LbuYuzkfUn7
	vytb6A7meysqjY8+thpTPrEWJJT4MBBKrmqgysXUVVFN85FuBrc/ykxldsmH6K7v8IIk7VCBzew2g
	uTtT9ehg==;
Received: from ip6-localhost ([::1]:28864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tk3fd-00CduO-5S; Mon, 17 Feb 2025 16:08:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25678) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tk3fJ-00Cds1-6J
 for samba-technical@lists.samba.org; Mon, 17 Feb 2025 16:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=tzXHjpwPfAmcoal1c0JhFY+a8FRPM0fRKNDrRkTutQA=; b=pUpxf4cEsnxV+pJLeu40/lleho
 o4OAoXK40j20aCin8IfYFKCWtDCNVfe3G1QNkB7wZO5/c0d1mIyDg/aNQOEAon+k0wM/tRTN/cXVY
 FLcvAax6sIVY65Ois+rsV5XAXe7FI/5tf5BDUDg/IsaUmFbYJPjYe84sddYy4LytR7P0STlr704VZ
 aCkiz/dCCjQSe1UyPM9ieAXbK5Y7Nr1w4sgYc32AKmEY6R1PJvIoO39/1en9VXw9hsRu6DC1B6K8X
 /KylfFwiJkc6o4O1R4NSNALWi8SVII25OJzzv5KIsO/0PcYFOFWm9j/gZr+MkSz04jbpgNJwz+za8
 X7Nd9tPX5cCumV8DQ3trucPpL3u7+SIGWg4ZX5Pxr/vfFRZa7SiTXx2wiumjntiFOLhQfOrRgsDyn
 sh3rgT/CzNgmEYhkbJIPaY2E+hl5tkea5T/1P+FYHCu+SGce1xdEIEu0ITQfAj42USAx0v5twu2Z9
 5Fmc3/2xTvNIZoz48HMb3OWa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tk3f6-000lR8-0q for samba-technical@lists.samba.org;
 Mon, 17 Feb 2025 16:08:00 +0000
Message-ID: <159aa7a4-e8e0-489a-b076-79c059c525af@samba.org>
Date: Mon, 17 Feb 2025 17:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.5
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

Samba 4.21.5 is scheduled for Monday, March 31 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


