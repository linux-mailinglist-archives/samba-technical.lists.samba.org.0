Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A156393815
	for <lists+samba-technical@lfdr.de>; Thu, 27 May 2021 23:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6J6ulqLoA1BR/ktHIyXjB+fAlAUhurmAZ5KDfUUWx1I=; b=5Zi+xekj28g73MBDGHsMeA8+jW
	SSznvy3b8ys1KEXYbRsr1hkpqmod5ObAINykP4pSoK4ddKEVgKmPkPPIsU7DS4e16d5phWkWchNjM
	LOuW1cdznd6Uzm2IW3zzctpSHRRqqDphZIbtWW0qNlJdz0UsGxlZyTSWtSfU4SS7ctXyLmWDmlSxg
	8fRuzKRzKMCkPbbucL1Iqm+1ywvkxZKnVcJqL5JO0PLOzK7bRAMJgjMeClXp4kTTquz6/lZOF/d6A
	2PWC3tXNBYeJEGtdodKYSZ89rgb+29Rqho941SR9x0Ah3veH+drwJTvSnpkCMIRLHKSrCI4bJqB97
	eKoiCI7Q==;
Received: from ip6-localhost ([::1]:39024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmNm1-004uh3-OV; Thu, 27 May 2021 21:42:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37644) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmNlv-004ugu-Vu
 for samba-technical@lists.samba.org; Thu, 27 May 2021 21:42:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id l3so2348624ejc.4
 for <samba-technical@lists.samba.org>; Thu, 27 May 2021 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=OARIsKJ7A8kXXbHi3+OvOys9I5e7jDed+HDnHzQJytE=;
 b=iiCA2fKpA73FvY7SA8KZ7ytNu6haPjEo43o7FzEL6B4YpS9xwIGXy8P0hN3nfZ78TI
 Fm372kbrAq4GicQuAS3W2Nm3aW4HBaDYBcgdXBvh+qOZODKD3IjIgjIyMOWTNK53Qj/C
 sqhO7ulvcK5zn0rGXGBesAz7oagYhOYcClxDLzb2YsbTogHJOesXoqET5IE/BYMtZsat
 Df2iM6IIlKAQGza6k3cgDisIXVDT1YwXMxmplKY0E9LaE5ZeBnHHFn+8vM14E33ZV8oc
 wok3saotWIaVuCfHRkF5AHnO82m1HvxUOBZm3QETGzgxXyfXx06LQM3vWFf7eK38oP8C
 KNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OARIsKJ7A8kXXbHi3+OvOys9I5e7jDed+HDnHzQJytE=;
 b=uDZ5I9Z6oYDBUPPWMlemxUuD3GkNA7zOxfw6R/dtVrhXoNytpQlA7UAUl0EBrQPeJi
 mS4dZt9utPaMvNhL6E6oaMnMk32SKJj+w25O0ihQ6M8L8B7TPosiXZ3Dhq6JLJwn/DO4
 s9EiUWWsFN5Sf+BLh/7Wqp5RT7SE9bhHw3IKhXmz9WH7qHsQBZkAYDgKSB9jLnwfjmPz
 IVpfmilWhv7I7e+sE22iL2dA3OoDFqHwYl5O9pzUB3qgaFwNrqph6pMneFbwG4p9ei8I
 9WshmZSEfsHSv+5tyFV48PVLmMqPtVlMyMSsU+rk0+RKRB2OEkCDZeb6lQudDekMN0cH
 PUUA==
X-Gm-Message-State: AOAM530vf7pVnfabcq0QRfiTLzuxfmxmgN8wtxfg69MQvhEXyWHcwSCv
 QYz7IL+mWRXnKGLzhN4tvUBNs7ZeZMh7XEMvbtSmi/BUgsM=
X-Google-Smtp-Source: ABdhPJwE5SbhEOgQRggk68MxyXOE+i4b0OlxRp5Foe4o0XjsFWevJ5437y+OEV/j8myvtrp0z5LR+MTmOFL2y34SNJ0=
X-Received: by 2002:a17:906:c1d2:: with SMTP id
 bw18mr5961345ejb.123.1622151750750; 
 Thu, 27 May 2021 14:42:30 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 27 May 2021 17:42:20 -0400
Message-ID: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
Subject: JSON input / output for CLI utilities
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I know we've added JSON output to a few of the CLI utils. Over the past
year or so I've added this to various utils in FreeNAS (using libjansson).
Is there an overall strategy for this? I'd be happy to upstream what I have.

Also is there an effort to add support for JSON input to them?

Andrew
