Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640BB16DE
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2019 02:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iEkf7BpLTb2Wz7LZSx1Y2OQm/ZaHy53S8lZTD0QfuAs=; b=Ln3pKCDDCGFpBZtrI//s97pMAj
	R7P9wJe6IX+H6MwFxZVhVkfOADj4ULD2wgSDzmVcR9Q+3BkjfPT9Be4hJZcU7KboxEp5xdgatCp9x
	9KYE2A+JwxOEYXaDfFdyXmTBUvCDwKOb95rlQVyMjVo/YCtDwB9t8mb4WYI+UIMhAwt976thixzWm
	FxJMz9AikK7r0Bp3ZWwdc3OwbP7qbmP++V2+dMUMh5WUumKyk0xF76XuEGBUdgx2JWnAfY6HuzLmT
	zak1VLqJdK7B6pJASFxFljaI1+v6T/kilZoRU2WW24hluPoyfj44eUPR68FzTEIXRkib2FdthO8vy
	zaCFv9KA==;
Received: from localhost ([::1]:34400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8ZLu-00575r-Uv; Fri, 13 Sep 2019 00:22:19 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:37838) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8ZLq-00575j-Ea
 for samba-technical@lists.samba.org; Fri, 13 Sep 2019 00:22:16 +0000
Received: by mail-qt1-x82a.google.com with SMTP id g13so31461506qtj.4
 for <samba-technical@lists.samba.org>; Thu, 12 Sep 2019 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=iEkf7BpLTb2Wz7LZSx1Y2OQm/ZaHy53S8lZTD0QfuAs=;
 b=kqfZ3ZG5KNL7wEDiKrBonx/eAz4EalxQaCu4e/PviREWCDXjOPkUGH5enMRDfvyT0I
 li6Lb8cmS6dAS966LbB0ggHK6cvIW1T9pn+UF0ea57J2r8vZ3l9Vpry3ezIobwT8VLRp
 +x1mzxXM4BDZ7iIC6IqYcnVB3qpXdTUbnJoY7byeLzLQFlGe7dOfsiy+hVdt4Q+EfdrK
 2bknWDkpmvAYA5Jt2QQURfEFimmKAQ2G4WzlLXgbZd5B3+CefzyAteypQrAm8/btKW1E
 I+1TLHSxj7GyLcCKFc8FU9i3WdluLGlPHESXb8VmBrS9Qmj7qkyttGy8Ruc8LFvt/DA5
 kJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iEkf7BpLTb2Wz7LZSx1Y2OQm/ZaHy53S8lZTD0QfuAs=;
 b=UNWCuy3SBM72eX5NcI6Yg5p2XHVt3Csfd822ANt6BwGEomyhD02tAgELS9r1oNKBax
 rOR3CFUDmhW2RUGWH42zWaQ+qSSHjUhP+2X8V4noJnlG0qGZC3QKai/BOac8MprHButf
 zoGmh+O6jNxSBXBokr4rR7NEVhTJ27E29xi6ZLOfB72u+GimYwWTVGimtFeV9YFuoPNT
 Yj/MqGRlCWt3BLv4MvT9sMrpYfLe7JimVm71S0KmnAtnFPzlMJO7K5eC9o+ZWpcvLo4k
 05eFy8dQ5ZYFWHm6dfPo6DVd9zLPlNUCO6vokQHsAxQ8ODofXKe0rGmt1RYyeaq/poO0
 MsBQ==
X-Gm-Message-State: APjAAAUORE2YROZC5u6A/lOxsBnUmOlFsamRHvPbd8UbaLL31yZBTk48
 DJczcFD2cWBHr995kHxBZ16F6kaxmWs=
X-Google-Smtp-Source: APXvYqznWLr0G5AewVzS1f+eU790roq5PZDMBIrzLBgG9Q3AEkLeMy0D5Lh9rMpb9OI60la8z1G4gg==
X-Received: by 2002:ac8:6d21:: with SMTP id r1mr269066qtu.256.1568334130740;
 Thu, 12 Sep 2019 17:22:10 -0700 (PDT)
Received: from localhost.localdomain ([190.64.28.234])
 by smtp.gmail.com with ESMTPSA id w2sm10840138qtc.59.2019.09.12.17.22.07
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 17:22:09 -0700 (PDT)
Subject: Use internal DNS to forward zone
To: samba-technical@lists.samba.org
References: <mailman.8.1551441602.2028351.samba-technical@lists.samba.org>
Message-ID: <5e4207b2-eb1c-2bdf-72df-9d1046028d84@gmail.com>
Date: Thu, 12 Sep 2019 21:22:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mailman.8.1551441602.2028351.samba-technical@lists.samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: es-AR
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
From: Juan Pablo Lorier via samba-technical <samba-technical@lists.samba.org>
Reply-To: Juan Pablo Lorier <jplorier@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

As far as I've been able to find, there's no up to date information if 
the with internal samba 4 DNS I can set a forwarder server for a 
specific zone.

I've set the dns forwarder option in smb.conf but seems to have no 
effect as I can dig @ the forward server and get the reply but samba DNS 
does not get the reply.

Is there a way to get this done? Should I see the integration with BIND 
for real DNS server features?

Regards


