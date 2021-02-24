Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07908323BBB
	for <lists+samba-technical@lfdr.de>; Wed, 24 Feb 2021 13:01:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/V6ROVaUdl+JqWpX7qVL0NmGG5qJA/coimBnwioQM3Y=; b=EJ04JK5HiAL3DTSFNzPG39HGYj
	87Cb+t5mDXyq/PTNtXUsz2gM+siCUiqjBPe6455H6vdHGPTREPuIocxPDgrzhA0PmqSte9wISK9/x
	JoGRIO30KCpfs/xbofVoPraeSY+9uruQzu2xBQGf0eX7YcI4Yyx7Czx0L2bDGQVataIoscQv89z2r
	e/6oH2bUNCuApj5FFR38AbgKZTYgVZaUCil5jZnG3M217H+faN/Ob+JuU7i166KxMFWKBucn4e6Or
	fz7X+kK7eQhm7pXstT6UvSen6ThPr0bPDySFE3KaeyyVJnxn4McrcomJEVQ90DljnhCBx+ZGLFcXc
	Rxpuxq8A==;
Received: from ip6-localhost ([::1]:60740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lEspe-0017hf-JQ; Wed, 24 Feb 2021 11:59:54 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:35115) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lEspa-0017hX-6m
 for samba-technical@lists.samba.org; Wed, 24 Feb 2021 11:59:52 +0000
Received: by mail-lj1-x235.google.com with SMTP id a17so2097394ljq.2
 for <samba-technical@lists.samba.org>; Wed, 24 Feb 2021 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Hu9XZA/m959S8m7wpDvKPuuuZ/Q4+cf2VEk6Zoff5cQ=;
 b=LwE6qfPuw8KEv8WL20w5yga3kRZ+hGfkF3vs5ktKaPHwYHXJrLUdTm/TNdZ2SYWVYF
 nA6T4a8wAO1QOr97lwT3Z/HoLpOdEmi8hNOGvd2KcwRyHyMLcrct9oQWPTBvrffBBMMq
 qY2whvwzxgE4cTujpA09Noqa+Sc2KrLB5GBytTfHf7eaCHl0SQW8w2olcKj2E5mzL+DM
 arDHfcJkkgTy/LQNMDWxKXtuWP7AHpiuTPOByBQKQ9z14Ih5xsh/cnuhV3RaRM14QuKu
 pJ8PqhRPzvAxWzlNom82yt9VVDgiPnJgQb52XFLVaiebSziM30MFFLOoHh1/E/UCykP0
 m8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Hu9XZA/m959S8m7wpDvKPuuuZ/Q4+cf2VEk6Zoff5cQ=;
 b=nCTwzW6h6V5IHNhqjpMD7gdBGU41cUEBXvS6DGk5LMj5i/2bGpNSCM+N2+zDuzopFg
 THmWzVWjLBdj6m0Re2wumYFbZX/Ty+oFIoTz/SGnFCDxTvs6P8Xp5/8TXbaiQCUlRBGV
 9gvhko03NXu3UipmHSujr0dp4hxRDDemKHR3yTXAze8nedn9f8U0muZDA3o0Au7xyL+B
 oB40Ho162AXSg4kzRPLcqS83PzUF6kJy3ynoVLnMhhJz0xytvZPliYACpgcfja3RBBwS
 wo+m+YvpWYneGVH0fCxHfza41Zu8JRzq2f4VKZO57MV98llrH+frGle1VYIahXGERBqA
 024g==
X-Gm-Message-State: AOAM533ulKC8OlkcZhBW/DcwJS0VIpDptAr7Q1JXu94QDvj/KcgUhFoJ
 rAtOJIYSaH7wRs+OzHUw9i4YzA9nljFOyaiTZqomJ5kLys8=
X-Google-Smtp-Source: ABdhPJyeVafNESArY+tWH5v/ONE3N3XasO/UPn2Nvq56VD9x7KjQoccJ+/1BorvUXJeUXrUGbnTGr1CNZK4GI9ZwMq0=
X-Received: by 2002:a2e:87c8:: with SMTP id v8mr3216746ljj.240.1614167988485; 
 Wed, 24 Feb 2021 03:59:48 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 17:29:37 +0530
Message-ID: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
Subject: Kerberos Constrained Delegation in libsmbclient
To: samba-technical@lists.samba.org
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi ,

I was exploring a way to get KCD work with libsmbclient APIs and i see
libsmbclient supports Kerberos auth but can't find any API for
impersonation and delegation.
Pls let me know if there is a way to get it done.


--
Vikram
