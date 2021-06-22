Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC93B0BCE
	for <lists+samba-technical@lfdr.de>; Tue, 22 Jun 2021 19:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=FxPWnM2nzBESBSeVwKSFWY5yV1Am4IvV6hH/h/iwhHU=; b=s3sUYVxbhb1ujg1Y4Dkb5tvPkS
	N00nlbcn7TkzoVQ8H7jHNLejNVBgLApQS65PbxTPv1+s7rGV9RYq+ze4l7Z0Pe+bvAZy9kowgjNw0
	FBmmHBvzEDJSmFvJrst25OC9TbJ2z3nD6nfDqja4E3lY4urGdhcwSkDdfDOjlARa1xCKEBUMcQSd8
	z2vyiUVDO4d1mFTUt5vLhOdgs1ZcCT3UNqM3SfVgPBT/p14G7912zKHSDqcI2s6+sEF88qjySsj4F
	7KelSXtTYeavtbkobxMscJNtNuqu54TXoMoY+4j5UlOsT+qKBxaxux1lQTwguMP/Q8AIWxzmqPvd9
	qA6bdYAw==;
Received: from ip6-localhost ([::1]:36578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lvkTX-007eDg-Ru; Tue, 22 Jun 2021 17:46:15 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:36630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lvkTT-007eCJ-3l
 for samba-technical@lists.samba.org; Tue, 22 Jun 2021 17:46:13 +0000
Received: by mail-lf1-x136.google.com with SMTP id d16so29815651lfn.3
 for <samba-technical@lists.samba.org>; Tue, 22 Jun 2021 10:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FxPWnM2nzBESBSeVwKSFWY5yV1Am4IvV6hH/h/iwhHU=;
 b=Oy8xrawud2O6hsSaAF/CLRkiw4tuPVDUJSYD+X57LKdrstGc5buwoV2Q5IKJa89s6i
 ipBDuUlydi8pajAKs1q5BAjNN7fPVmf2YNWN61VrxsWYmZp97HHR+Z8d8IRwzg6Mw6F7
 p2dYIP0WkR1BLi5TEuQCSZb1UHNxr5iQgznRU+hdgA6c8bjKj4dp6e80sLi6tZH2usYo
 r93aEtuUinRCmtLeVJqw8ua3tVid/ZgRc/HxVJCl6wzsX7Izi+94yw6GDg4o09SlgR+y
 u6eKo0Cx0+s1D6to7jmQNWd36xb49xOuX+ZxWuVxuaImo+ZSs9kELFIrkdfphZCps19w
 1VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FxPWnM2nzBESBSeVwKSFWY5yV1Am4IvV6hH/h/iwhHU=;
 b=mpdqDQ0omvDv4G1CZyIgocnpQdFsqcvy0xIgeP4bJPimLOpTYlch/gq6yRM1/Ss7EU
 +jmrtp/eUQXYUwi4XqiwsJTayaWIzlBoI5yaZArD7xM6KjoJPjmw153n2UYmtFaNpqUC
 QlYQdAIVwaCJixrSls7A48bHv6+noSkOb0nQGJzYGSlvfPugSeZRSfhwCH4BPxFsxIu8
 /Idp9YHomMmWTSlzh36SVQqDJbrzzN4uiA4FfTQtWa+lzJBMQCaBaBL95aAvAujmhmZ4
 MyZP0kamI/XGT9clhgvi9YpMIWP34yXAw2C6cjdzYh7nX9og8MVtS1UN4xQt+L2qMKng
 6A5A==
X-Gm-Message-State: AOAM530J4Opnw+JXQX/RscbPRlBQT9+rt2lDgUHIM5wu4Uxyktj+FGaw
 f4OC8DPRX4aCwcgD360QutssEMKNPNHlTouCBGY=
X-Google-Smtp-Source: ABdhPJzqrSj65fqXRPu74W0R6djEKT8FC7BNjM/WLrPP8jS4kzm3wFoPrV4db2Y08ahORHZPQduyruI3AFMtAVoUheU=
X-Received: by 2002:a19:f705:: with SMTP id z5mr3676245lfe.395.1624383969085; 
 Tue, 22 Jun 2021 10:46:09 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 12:45:58 -0500
Message-ID: <CAH2r5mvUXZtY3=LNzt8_icDfUAAeZpzjUK3sEErzpCksFDX2WA@mail.gmail.com>
Subject: Processing ASYNC responses
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, 
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed that the client isn't checking for SMB2_FLAGS_ASYNC_COMMAND
in the header flags field in the response processing.   Are there
cases where we should be checking for this?  See section 3.2.5.1.5 of
MS-SMB2



-- 
Thanks,

Steve

