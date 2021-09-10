Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D42406B7C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Sep 2021 14:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Cp53DLUa09/2wwP7GcA4Y9Vy0yTJqaZgYnP9h6zbqEs=; b=WdGHXGkeK/OyxI7QABuij6peC4
	7riZLsj5kic1uY4k/FxBH6/NK1bI6L6xvKz2qFiC8HY8cJreaHX+zChLs9KLMoz8kL7dbAvsQoSkr
	jbTSbIzJMNfINJzS8xs2Jbr+LXrfewLTdB2RonA4FTt7KbNS0g8VgOdeGNwmFMWrYNagEIuD2Xd+Z
	XVWydSof13aA1/4CUOwRQatRj8TUJDKxeqkI1j+7rWwk37QSVC/UAxBN52phYwQtUbtcp06dVegF1
	cxCNdKnT6T2sFT+yykDaujFuaD+DW+YOUaSBewFMvLjLFiTSV6vDpBTFcHe81kC/q0YLCH33lkZLF
	nlwOi68Q==;
Received: from ip6-localhost ([::1]:27072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOffv-00EQCw-N7; Fri, 10 Sep 2021 12:30:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13242) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOffq-00EQCn-JF
 for samba-technical@lists.samba.org; Fri, 10 Sep 2021 12:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=Cp53DLUa09/2wwP7GcA4Y9Vy0yTJqaZgYnP9h6zbqEs=; b=fR8zvc3gwdnrvWbPrDsfHik4wN
 RNDrvmxfbc7f4hWuWtBwVBqbc/Drulx9H5TxKv4uGI0Yrbwfm9nhDuVzQVRpDQ4oc6gjKaA1B+7ZY
 g1KDMeTEj3jraZgWifomWtsfxzeIoXvScV2kDyOiiBwNokxansS0J/ghMOUElgg4bo7Y6uAOGX160
 N4nc9Xh7Nf1CHAPu+5QiAXXZSJ78UaD4PTFdNe009J2RgLynDGQcH/y7c8HfHCMHeAmWC3IwpUZwU
 McY8+kn1b7v1d3WTTLdnSIpyml+jrz55xrni+/7telNUywvrZSPgP36KQyxQipTtwCa74TfDFLxNN
 gAlcXRCxt5I0vqxZwt0jWIdZ2FFOs8Ak59BXaiVUv8XU8gt90aABi2AHfnlcWIKqCy0BXG4vx2Jou
 vML9itZ8OTIs9+qMPQ3POq4O9cKZ3S0qISg0FE1DVIFzQkJQomNaTiRDNyvTSgElNQAcTWGVpIK2O
 oWARHsDIPzTCbBQTmPYqbFSn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mOffp-005Z3i-LX
 for samba-technical@lists.samba.org; Fri, 10 Sep 2021 12:30:29 +0000
Subject: [Release Planning 4.13] Samba 4.13.12
To: samba-technical@lists.samba.org
Message-ID: <dfea055f-c505-41fc-b133-cd5738311e1e@samba.org>
Date: Fri, 10 Sep 2021 14:30:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

I will do another release for 4.13 on Wednesday, September 22, because 
some important patches have popped up.
If anyone has patches that could also go into 4.13, please assign the 
bug report to me by Friday, September 17. Thanks!

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team	https://samba.org
SerNet Samba Team               https://sernet.de


