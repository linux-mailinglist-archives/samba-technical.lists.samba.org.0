Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75576372569
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 07:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=fvSjHBzDejWU7lHToNuemq4nNCt2YddMWt9HCBCioYA=; b=o4WbXzC3awlPwevbCKDpkDL6ik
	RioLZLU5j0xXDPjv0dZMFSzpkT+45GuW0dJsPjnn0aYBnBBbChMr0FjXe7hbhM0LPCIk149sRCykp
	ADGKdGj7kwKta036/9MBCV8Jyj0weXq4kIjz8pBAcEC3Vd3YGEaVr8xArn+Sv+Twlvm4b07jeAC3O
	nBjtYQXARnmryTXat6yOYr/wkUAs4Q7O25aK2yNN9CaE41BngNhOW749wRgpXSt1LLc2LmPDUGU2f
	/Qr8n/BcVd/ZsB08y+vkQEzKUBezBCBXVrYhud5miOeCOpVh3/oTjQV9AM+SDeyMn1Mr1ASsGCcJm
	p1TQ8CEQ==;
Received: from ip6-localhost ([::1]:42320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldnT2-00FORu-Io; Tue, 04 May 2021 05:19:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34728) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldnSw-00FORn-C9
 for samba-technical@lists.samba.org; Tue, 04 May 2021 05:19:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id t18so7887914wry.1
 for <samba-technical@lists.samba.org>; Mon, 03 May 2021 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JvkCY/aF/ZjZkz34HkrC0D3BAFwzlyXQCV08ULnZb5w=;
 b=uTmRb3ds2GB4/+mhj0KFZ2O19qYYY1byzQTXHuVyCmvxuvbuS9aa9EvizJ0FIv6Ha5
 m5WygnQFZMtK1rvmTwsayI/vbmo5OnbadZzCkCk9v4JcaNuCErqz/ul+gtMGn7pgs+jN
 AY+FfdzUh2Hd17cE6PCAvV9ycms7hG8uSzEWHlO0wO5AiATJO8DSeYfadmGod+3xqbqk
 yXZ1A6Bag+P9X1jpblo4okHhIVDtWus189yP7yqUM6YVNxTxlplVj1+RwzLmla7xFxaY
 T9H3Zdb0CY9cyp8xZ/a60KIVr8dM/LcEvVaxJ0SoR6b+kLUvi/zoUvUfutb2578opTIB
 CXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JvkCY/aF/ZjZkz34HkrC0D3BAFwzlyXQCV08ULnZb5w=;
 b=alZ9AQi4b+ImxCbqJbb6d8RaXla6fF5BhGiSxfhGMy7Q6boglJhCNclM9+FlnGQzee
 CsbNdWk75nWylTcuRnUEdlZXHtN/FOlrWimOt3ihkDK9QSJtyjDCPULQpxscZNc5vVzL
 l5mU6dOqGlWRIFAW7K31fOQJfG8wZOSNNfJTwhe/jMTsdxOio0bz5nqM/cjtwbktYRx/
 JlAaGMpO6aF2AJtUDFMSe568B56aQRlQbm8NlH/zbz6mqXRetPMQmFXQ2ZvPhPIeNTjS
 dab5T/Wpb1wYMTpYmz6uUOsuH/RoZGekmQjeK8EZTNAmQ/KSNJ6HuqRTe8ZAFuI0uxBE
 l6OQ==
X-Gm-Message-State: AOAM533jw0grAX72HXqxYJNjHKtGbBEBtq4Lw8F68ocOik/MFFljveAZ
 SsHZnPw/6wGC5EaPMAptoV47uSLyDc1ViYKj+ilqZsveVdpUcg==
X-Google-Smtp-Source: ABdhPJyen7FUaynuVCVRfP5/BSJlTcyILvDy3YlSTp4teWZuColI+hZPPbUSiHAvXxKF9fnmuMqOt6cU3kWmAYK0Jdc=
X-Received: by 2002:a5d:498c:: with SMTP id r12mr29905116wrq.31.1620105564975; 
 Mon, 03 May 2021 22:19:24 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 May 2021 10:49:14 +0530
Message-ID: <CAHbM3qgLd2RuVMo+nfnhCOB8Ocrf_9KzMyyzcHmvOU1fO1xKhw@mail.gmail.com>
Subject: entry in winbindd_cache.tdb gets overwritten if child domain names in
 2 different forests are same
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

We had a setup where child domains in 2 different forests had the same
names. In this case, we noticed that the child domain name of one forest in
trusted domain cache  (TRUSTDOMCACHE/<domainname>) gets overwritten with
the child domain name of another forest.

Attached patch helped us. Could you please let me know if it is applicable
to master as well?

Thanks,
Shilpa

index 4a366ee6ff8..c074ea80862 100644
--- a/source3/winbindd/winbindd_cache.c
+++ b/source3/winbindd/winbindd_cache.c
@@ -4199,7 +4199,8 @@ static bool add_wbdomain_to_tdc_array( struct
winbindd_domain *new_dom,
        list = *domains;

        for ( i=0; i< (*num_domains); i++ ) {
-               if ( strequal( new_dom->name, list[i].domain_name ) ) {
+               if ( strequal( new_dom->name, list[i].domain_name ) &&
+                    strequal( new_dom->alt_name, list[i].dns_name) ) {
                        DEBUG(10,("add_wbdomain_to_tdc_array: Found
existing record for %s\n",
                                  new_dom->name));
                        idx = i;
