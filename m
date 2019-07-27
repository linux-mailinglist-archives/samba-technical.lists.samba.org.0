Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A3877C60
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jul 2019 01:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iCnF2sFbexsnn/VqrkhHnQtq3JuhxIo08eg4IoEhFeI=; b=Mw+Zt4LdQO8a0qf6SIIUdYNVqh
	+wBRgeRfnneJ69TlekkeI4AXng+4x6VLVooX/M3vqIUXRPWCtdYJARg0fkwcZcsHu4KcodA8xq5mc
	ZlctS9N7qI07S7z6BpwRfK/d6MaIPBWx9DsIeZmjEM8oxEGsz73L6T2xyqCuWgP73gbkFJ++bcJ6m
	LxNcnlWtxKwPJaUHajxkXGf7Tr+9ge8aroZtOhSqW6CnIbvmBvK6fyCW/+n60hBbJLRpn0YN9Iefw
	k3x51cS25ZLxzaP3m9O1kZrx8EuDbg0JkuGu/89uDGMcgRUOMIcatK2SUnPYQ12ZLjlKO51n58uNa
	LkeWYM2w==;
Received: from localhost ([::1]:57586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hrW0x-000akh-K5; Sat, 27 Jul 2019 23:22:11 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35484) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hrW0r-000akZ-W4
 for samba-technical@lists.samba.org; Sat, 27 Jul 2019 23:22:08 +0000
Received: by mail-pg1-x535.google.com with SMTP id s1so20115360pgr.2
 for <samba-technical@lists.samba.org>; Sat, 27 Jul 2019 16:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smedley-id-au.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iCnF2sFbexsnn/VqrkhHnQtq3JuhxIo08eg4IoEhFeI=;
 b=iM/30ajv2LG0bzSDB6SsgfM3gCFScMrpQ0PpoL0ZwA9tlUS6l8a9Kbq4jaVLkWbT1d
 1HVvtGx5OL879WkEef6Fu2j7xHmCpYjvxuke3GMYeHSF19jBouwjoMsfDTe3wxoHAxhH
 nbVxiTQgXnvxmckfyrE025dBEVXZ+LCmFQMRL1ZTRuY/P3rJjmqfoEk7EM0qWOjDdBXU
 bRW7mFhPbYJms15MmcacbLV7QzxcDuLK9TznHM5q//RIAO2n06/6Klgzk/Yq8NS2x/yz
 88gilTxqXoolS+97ze9Qi+CaSL6Epj8v/caY6zAsFWvhqFdjUbL7fGWDv89V7j8aQrzY
 vZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iCnF2sFbexsnn/VqrkhHnQtq3JuhxIo08eg4IoEhFeI=;
 b=Da73i5g4xGbuWhtsSlENxryoC5YbDAfdXySCi/rpfoClZ0yScdmpZh3mMbIP/2LRTD
 7wrEliGVL8lHu4v/yLbv5CF5k8wPLmntgAZ8GZEJ+S0eeoCG9V9Yz079MDtEfvcP2vxp
 5KkMSE1WgO5/ogC991MVa3QZbFPRg71Wk4uxukq0OzXBz3FrehWerVVh9iB/YHmVB5yH
 Azsz6keMyMW45CNWtXmDoLo1nPEAt2oNn+Fr2PfpmitGOl8EM69VQo6QHqWgryx2UxOw
 JLfp5IAuX+v0nuYJhvsqnI95D+CPgsgpDKcJXI2lbcknHRw+YmydMnyfewT5+7t6zVWA
 Vp7g==
X-Gm-Message-State: APjAAAWgxdqYYRURmXc5dHpAnjcQ4ePfAf4q95FXvolxdltLVvYc8gC1
 zYBXqRIviyH6j3CJRusDx2PAVJC4
X-Google-Smtp-Source: APXvYqxiZIDGLAYHH/ImkgQR6sSMI+or6J3M2MPNMlu+U+xqD8u/z7q5b5VYmaJVPDl5nOTWvlwuAg==
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr29947081pfq.25.1564269722548; 
 Sat, 27 Jul 2019 16:22:02 -0700 (PDT)
Received: from ?IPv6:2403:5800:5100:f00:cd81:212b:17ef:76?
 (2403-5800-5100-f00-cd81-212b-17ef-76.ip6.aussiebb.net.
 [2403:5800:5100:f00:cd81:212b:17ef:76])
 by smtp.gmail.com with ESMTPSA id j6sm74637801pjd.19.2019.07.27.16.22.00
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Jul 2019 16:22:01 -0700 (PDT)
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: samba-technical@lists.samba.org
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
Message-ID: <cecb5641-2d82-b548-da2c-7f39979dff44@smedley.id.au>
Date: Sun, 28 Jul 2019 08:51:58 +0930
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Paul Smedley via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paul Smedley <paul@smedley.id.au>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey Andrew,

On 26/7/19 4:57 am, Andrew Bartlett via samba-technical wrote:
> I'm more thinking about the DOS users, the OS/2 users and the Windows
> 3.11 users.

OS/2 users now have a Samba client based on the latest 4.x code - it's 
included in ArcaOS (https://www.arcanoae.com/)

Cheers,

Paul

