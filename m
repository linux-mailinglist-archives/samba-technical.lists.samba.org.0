Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7218C8A5
	for <lists+samba-technical@lfdr.de>; Fri, 20 Mar 2020 09:09:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ywJNltKSTW0rcbaDRiBniKI9wjCsVcJoHDJjcXv14W4=; b=UJIuTwGYNcmzb2txbDBnmyFLl1
	K9A9t1GMzxqhhpWrrSSmaC2m9yiVedFcaV5IkMDlPY2NF6iccB/b2rmXoaaaxDZXbZCJ3LwEPFD5P
	rzqUDGGbyJOBF+mmuCxPfKW2zCBujOwpD/lBt5XSjR39hwhDIH8jVhsYp8sdtyn0znNzUCNBtzRfT
	IakhY9r/v+w2Qakhojv5vv3ajPwFn9p5OkebhEjw2eoU0hBXAAF4/7HZOLXw+9p+/GQTkDjDuQLx2
	X0qFHIJh271k1aWX+qzpW2IdV/80UXVOJGc2DTIbKW5BLgjvSeNp+2KQPpZkl0yucOm+GdpB/+N6s
	gU1ObJLg==;
Received: from localhost ([::1]:31350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFChE-000FjP-Ji; Fri, 20 Mar 2020 08:08:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFCh9-000FjI-RV
 for samba-technical@lists.samba.org; Fri, 20 Mar 2020 08:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ywJNltKSTW0rcbaDRiBniKI9wjCsVcJoHDJjcXv14W4=; b=yT4IB/kd6sbOXs2dETpoLuZQ1p
 I95Qm4fAHmrkrFgOPMmaCajaV0UnFArWgdmoWGFIIwjacGcOxI8BwZwINGWlSoiBhW7xX9VzKy/W+
 4xrGcHzp+qPZPTAjnXeE7YP3+uiHzmUV4+lFXt5Q/rzZpIKuThWkVSI37CkM46g+S+G234hcrlBTF
 zdLe/2HWugR4vtYpJ9lRjiVV54swB/8cjW4fKBm338YGaIuFxmNOhXQpQUEOz0kxfQw6ZY9BCbm4Q
 UQYtbYYBvWFKgO4a3NRmshDcx/Ztbr0nDm3nqvdZnVIgtI8OVeXcZH0k00PjlF+mOnc2hU3288MV7
 KXHtcq8H6KqDzTXC4wLB7+5GhccbPxVBFkCIONxt8R+AkoucaHhn4FZo2pprEP1w+hUPOq7y6VL6j
 K3oE4uhHLU7WDmw6c0lMq+oSEBu+q8Cu7kTOmupOyvTknrJfnBqSeI6VPMilk3bfjtH0coEZrSKPs
 5S9OFd3G3qJ00yCclHC20eqp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFCh9-0005NP-6o
 for samba-technical@lists.samba.org; Fri, 20 Mar 2020 08:07:55 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Last 4.10 bugfix release
Organization: Samba Team
Message-ID: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
Date: Fri, 20 Mar 2020 09:07:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

for your convenience, there will be a last 4.10.14 bugfix release on
Thursday, March 26 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
has been updated accordingly.

If there are any important fixes that should go in, please let me know asap.

Thanks!

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

