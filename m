Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FD80A9F6
	for <lists+samba-technical@lfdr.de>; Fri,  8 Dec 2023 18:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Hx+KXbsrDsXqQ/asxho25qjSNIITqY/mDTMJmu3//Io=; b=26N1t+BhlwfG58aVeiO+yihaco
	ix1m8Ug/qF6neuVEI2rnviK54xLh5BCIluJYSd3sstKFL1BYKpszGzoEWGDbhhz3sXGJrI1LZmv8V
	ab19kaOSTP1UlMd2HqyYLVfknhrSBto+w0GoeBusSx+1uc8oVxStmojOAmPo2EYXsufScsijJFFqB
	orAeU5c29DhLTp2X/XgImudUxcTNXrhkds6Eh5Ndtdx52UsN+tD6bui7WKsQZcfyL8a99ya0ZS/Mi
	wF/rBnGH+r6f/RNXmB4Ydss5/xeSDnJUKZAH5SVY9gZReC8QYrRWiB5CvjETaU7EBResoeyX/2x17
	H373fClw==;
Received: from ip6-localhost ([::1]:50772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBeES-005BVX-Rx; Fri, 08 Dec 2023 17:01:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:57682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBeEO-005BVO-D2
 for samba-technical@lists.samba.org; Fri, 08 Dec 2023 17:01:42 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so2598525e87.3
 for <samba-technical@lists.samba.org>; Fri, 08 Dec 2023 09:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702054899; x=1702659699; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hx+KXbsrDsXqQ/asxho25qjSNIITqY/mDTMJmu3//Io=;
 b=Gc0seFjTaag7AvS2m0aSU/2RgxNIPmSLPkMRg1MVJvqAstludYO0ks0KtoCOlo2BZa
 dLyqKcbCDcSEEuiBb64Xwg9+SDe5WiE2sUezvEYt02HInOFu6tEooMRF79iXteNAZoBR
 bGMXymWbOJNihmTGlvw2YnT0kRX6YlzFU7AL40Y4izTAlVr/+l8NXiQUheDh4QJ5gVep
 2YmQ9u3l3s/glGX9RHWmIEga856vpR4m5O7R0WO6SlqBWVejvo4A8tdnBIn99y9cIJEJ
 TSPRBreq5DEGL1oo6KaXdivR2E3w1IFdPchhjJqUziV1w/F8wLKaSAgTYsk5ls+cC4Cf
 T+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702054899; x=1702659699;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hx+KXbsrDsXqQ/asxho25qjSNIITqY/mDTMJmu3//Io=;
 b=Wc4uXKkmfQkHWPl1gqvnVmV/9QEU9f6gffIjr9TZrlenBbhs7Z93ceABB+pE3vZMSi
 A5yuEMQax4VLi3NIfx9toicBis7mszpDDBAJd8+SCaHa5XrR6TXG7s5JI7nErRUdktzB
 kSHSBFIfkA5OdgSl+1Im0yQo49HVxFnQrvPn8ySRKDkp1b11qQXAkfAc0wDefOSVKg5o
 bdrbbCGN80TtYlSTORNHBTClUaQSMXYsHMmSDhjMkLUHaQ8vpttHe+lnWi5eLOr+L7yS
 hjLNf2Zcygn/CrNjk298Jm0asrCMwttKeq8etEPMNEkM5M+JNnpt3Z0C5Sb+4LjvgwCv
 qEsg==
X-Gm-Message-State: AOJu0Yzm0UqBMIjFcbDh+syGptdBBrbvedqxKn/fV07iDZ4WXmcyNAhi
 ZwAp5p7/zPGhp+eUIVfb+OlKsosY5cJxw5F6zfztJDV9ZHY=
X-Google-Smtp-Source: AGHT+IHWoPbuGSShxjR5HvyR57kAa14AEktbOwWC3/ZYoENSvlNd1Q8kPjNtjFOpN0sqDeJapBz2dA1iUIWVEF7vi9w=
X-Received: by 2002:a05:6512:2350:b0:50b:f798:28be with SMTP id
 p16-20020a056512235000b0050bf79828bemr115677lfu.92.1702054898254; Fri, 08 Dec
 2023 09:01:38 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 8 Dec 2023 11:01:27 -0600
Message-ID: <CAH2r5mtK-JQeH5gLoGjUS5sywfd-KTJhnF_Mf4c+KCoapMEPhQ@mail.gmail.com>
Subject: Lease keys and hardlinked files
To: samba-technical <samba-technical@lists.samba.org>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 Meetakshi Setiya <msetiya@microsoft.com>, meetakshisetiyaoss@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Following up on a question about hardlinks and caching data remotely,
I tried a simple experiment:

1) ln /mnt/hardlink1 /mnt/hardlink2
   then
2) echo "some data" >> /mnt/hardlink1
   then
3) echo "more stuff" >> /mnt/hardlink2

I see the second open (ie the one to hardlink2) fail with
STATUS_INVALID_PARAMETER, presumably due to the lease key being reused
for the second open (for hardlink2) came from the first open (of
hardlink1).  It would be logical that leasekeys depend on the inode
not that the pathname (so could handle hardlinks on the same mount)
but that appears not to be the case.

Interestingly the case when two clients access the hardlink (or eg.
nosharesock mount to same share on /mnt1 and /mnt2) works more
logically:

1) hardlink /mnt1/hardlink1 /mnt1/hardlink2
   then
2) nosharesock mount /mnt2 to the same share
   then
3) echo "some data" >> /mnt1/hardlink1
   then
4) echo "more data" >> /mnt2/hardlink2

What you see at step 4 is the open of /mnt2/hardlink2 generates a
lease break of the (deferred close) handle on /mnt1/hardlink1 from RWH
to RH, and the open of /mnt2/hardlink2 is given RH then after the
write to hardlink2 you see a lease break from RH to none as expected
before the close.




-- 
Thanks,

Steve

