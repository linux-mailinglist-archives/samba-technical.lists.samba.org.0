Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B5400D0C
	for <lists+samba-technical@lfdr.de>; Sat,  4 Sep 2021 23:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=T/QBlFAyRgZ1TIsjQQSnExCgr5GydjPKbGbzF2iPicY=; b=jsC4wd4eh/MRZN9ZSdt8qu++YW
	atPOe2D8pN7isIgL3xNG0k3WUwP4R+FgZfzYZNnon1+ihiZFahZUA+VB9bndF1RpdjseC/b+QHEaR
	uBThZUKDlN54PKjCnuOgPFS4Y6ynyo/DxgEF9i2v/5npnWs3cWSlzle1l2Xj6dVMkySHiZOtJ5o6A
	7/sny3Uzv3Eh2sizRSaIrvp5DBtN3hwQ4HeLuEwXNAKT/bfR5yPwgFh0PXe625cJW6nRhfaHBkCHr
	yesH2nt8vaed/1JBkAVGHeWS+fLb6LXiBlh9BKwXT7Yh5ZJK3aDqnhX2mO4gc1FVDtBXpoMFzyTD8
	koxo2GDQ==;
Received: from ip6-localhost ([::1]:20584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMd6G-00DL8g-UE; Sat, 04 Sep 2021 21:21:21 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40484) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMd67-00DL8X-2m
 for samba-technical@lists.samba.org; Sat, 04 Sep 2021 21:21:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso1869250pjh.5
 for <samba-technical@lists.samba.org>; Sat, 04 Sep 2021 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=T/QBlFAyRgZ1TIsjQQSnExCgr5GydjPKbGbzF2iPicY=;
 b=xrTgTPBvju8nugmB9aiK3xuauNvwRj8LmRf+pxzlXCEHZbhlpVjziu6q1pIlC3p5b+
 w5bSG9qM4UwixRx/ny8grpPpK1qBQPF3qM5i1OswoeivbeS8wNDDABtgPdEiJkrB+Ja8
 re2jY3sqIE6nZZh3QLwD5ZnFVYmBXA4aOPjZTQig2O8gCA8YGjOCzt+g0cRqbvxePVXw
 8qJbKiyHyr6Iddjiyqr7+aKu83LFoDPNzPCd/RYsSplRf7cfHFQKQXo/rpC1nV86P/xF
 XyfT5szUKBJRtePQ/uyuPFCxrDW4AGTPzKIryWcLKXVg558kwQcF+DJLtfx1bl6TFPvO
 /6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=T/QBlFAyRgZ1TIsjQQSnExCgr5GydjPKbGbzF2iPicY=;
 b=n3NfwyPAfvYRAH16mujbcOZOLcizhpP9ioMHZ/tHUZIiBQz985BkXyM9eaqoOgWiIq
 zUWoGxF9wKZfqvz+i9y8FQrkWKoc1F8gc0oJnF9hWViih+rqvEVQlqCidK6+6V/Q4DAZ
 5gYAyBJSzgZ/CI53DWcL/qhA0is3x68uUhY2nz46lGQfDNWB9jkciquZUu/D06TZQlWD
 8/zfDJcLlYIxlgs4PtQQMQ3Wm8LkdRNtwcV6OX2PwQZDy/EIgm8dhGPKxF75R7AX3erE
 7pDiDMDoLoSpxeyt0qUleXdFqbXtuXc1OoN+CJ8+5C1wz0DsoOLftiSKDByyoEFGDRqq
 1dxw==
X-Gm-Message-State: AOAM532+bbhWa9dujB6MVJJ6azxmgEXGtp6Yeij2YFBftcC2zcJEadG0
 Hw3MONhmbcihJRje8i5SgLVKg+/RikTSTg==
X-Google-Smtp-Source: ABdhPJxU3F274dnAFQAYRzVoQ5O+Au9qhbGDKd2zqnGWogblUXGfyOSgaIeCwJCN8+7Cwl/eGNZjZA==
X-Received: by 2002:a17:90a:3f83:: with SMTP id
 m3mr5986907pjc.46.1630790464006; 
 Sat, 04 Sep 2021 14:21:04 -0700 (PDT)
Received: from ?IPv6:2407:7000:96b0:e500:e733:ba37:3588:8ee8?
 ([2407:7000:96b0:e500:e733:ba37:3588:8ee8])
 by smtp.gmail.com with ESMTPSA id a194sm3130447pfa.119.2021.09.04.14.21.02
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 14:21:03 -0700 (PDT)
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Request to review developers 1st merge request
Message-ID: <111771c6-35e8-66e3-0d59-37d5cbf7c75b@mattgrant.net.nz>
Date: Sun, 5 Sep 2021 09:20:59 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Could a couple of you please review my 1st merge request,

https://gitlab.com/samba-team/samba/-/merge_requests/2148

as I want to see how I have done.

I have a few other patch sets I want to upstream in the next few days,
and it would be good to have my coding style and commit message style
checked first before the next submission.

Thank you!

Regards,

Matt Grant



