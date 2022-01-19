Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B3493D50
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jan 2022 16:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=+kKjiMFMn4d5D/gafRzzaOC5D8f9KLulmOqThVdHKPs=; b=G0D4erXi07vUVW5zob2t0FZzu2
	kyar6zmjr8cFAJbPC0Jb6OYt/Bwrey0kbCmBG+bJ2BG/23cqB9dlwCxzLI8rZ264EVN1nTjojpt/y
	tYz8EKnEdDgfJAAPG+M6ACmJ6LGx3JTUGQaNRaRXzXEajZCfEgv4hVj6n7IaWLCwZVexyk2l8+7C/
	fiPIRnsM/Caz92xQ+8tbxRzVVGONhrYZp8EpAlPlqbWcuZ4kW5HZU+y/fq92flaZC2f9UaoHF0fip
	xJp9YNhF/QNODh5iY9YK+B9ICFXu9Z3UKYWQ8CL+g25kkqjGhQTFh2WKAHDo/3UwuSYbTm09TwnG2
	KYIFDfYg==;
Received: from ip6-localhost ([::1]:59836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nACzp-009w2w-GX; Wed, 19 Jan 2022 15:35:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55160) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nACzk-009w2n-GF
 for samba-technical@lists.samba.org; Wed, 19 Jan 2022 15:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=kSLxwqWE0jGpJKTbmW2Vf2IuF/d8GegY3mA7W3ZNYnU=; b=jnJN/sNJb9k0Qfz3DWXD2xFpCS
 g7nOe3YCEt/ZWf+vKxq3uxu+U/1xoZGR+azbj06rTXJ4JItSvWMTA0p+WMwqk8U5RvxnIjAi12aP0
 ckGSwvklXmqiaPNOrbPGaXFNe2vZTIPU8sK76X5DW9KQ4854PurDKmsyI+NKBJCKFW/SFZD7AQM6h
 4/KEY/12ehRwOLVOCMlpsgbShKlu8XnqP+YndI7ZUoGSwvADnRFl3iMreMLl9DSoTDaed3GBAPjaY
 Dnmg3KuYCUuT/jtLj4cKzQrLKXsT+sc/ngsL66VWc2sYH1N2kvULaysl+0chn8eTKAiY2XpjWQZeJ
 JzE/mSpywr0op73M2FX3yxLvExbFMDrnZHxWvXbTdZfIwD9raBC9LwRkxl/pfHfLNG+BRN3fB9/MD
 auMEv1zhOTCArvIfSYB5+xC4hRbe/B3h9GPQwHqea4ycRXacqWARpijx9RN8D7runtQ6ynQh/M3GP
 PYe9Jt5LQJeeENkc1vUo5I0W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nACzj-0083qa-WF
 for samba-technical@lists.samba.org; Wed, 19 Jan 2022 15:35:32 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.5
Message-ID: <b277778a-161c-507d-f44f-65c20a94dfcf@samba.org>
Date: Wed, 19 Jan 2022 16:35:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.15.5 is scheduled for Wednesday, March 2 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de

