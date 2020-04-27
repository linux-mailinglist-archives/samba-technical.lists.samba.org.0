Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7D1BA1BB
	for <lists+samba-technical@lfdr.de>; Mon, 27 Apr 2020 12:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=IQR1Sw42uvo9OodghUqBiAObvySqRhaeQUxm12gWCD0=; b=kfa6ekn6xBFw2wZDj3u8Sf8IYT
	xDlQ6E0vlmhNSq3SbDtx3lVluwxBUjkH1tJ7yHfZYidUhbozclCMGbz9gbzW/6qIozmHc09GvdiPO
	trYTmQF8E394hgE+LqfRvkltOc0J5sKgcT8DlFO5i7K7H093TV4iOyglPNE8uq7cVHq4fSLaqy/qf
	r9fRf0U38OvUmLPmr5kfkw8jcAgU7gMp7pGia19fUUjOqFWSzR784/Oh4gWruoRU26M/p/vE5KTig
	5E6/Y0VCchnfdhZChI02sPezYEI/1Qlo43k/L/zGQMHy9fY0gwvINOno+s/IMjXocbj+3MGxjWCL3
	WPDTUiXA==;
Received: from localhost ([::1]:39816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jT1NG-002Abx-Ry; Mon, 27 Apr 2020 10:52:30 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jT1N9-002Abq-Tp
 for samba-technical@lists.samba.org; Mon, 27 Apr 2020 10:52:26 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id d197so4782440ybh.6
 for <samba-technical@lists.samba.org>; Mon, 27 Apr 2020 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DTN4S3NjbQeZdO1UeLgxuRZFiPPsK9cQGVOdzJcrwLc=;
 b=Y0uAIOYHnSe6bFYIbnCag+ds1MKaaR/eCfcfAppoUSP8NZ/ee1BqyeMg7ggFU5c4Lk
 gvoCpfPnih/N5ISvpGfL1h3LlTZgx3ENXaD04zCMh1WoXIflb9X4qnU47m99B2IHWsT7
 FGVlU72y8htF0IkK7VrzX9ItiGZH1mXk3YnfmeVXR2DyCZwy/aU60et2xyrUAH/QVhSa
 x6Tm9YK0cYfZbyIacawhreJtGmYVu8vpFxABQ43bC10pzXSGd7BhqR6BH3Ks8RXpHJ5e
 Bc4hd6su9ZcfW9YJo1MuIQFHGe2zcyYI/+JCtjXFJYZ4hTwjzyjsr9BKYVKij/4e/lK4
 MkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DTN4S3NjbQeZdO1UeLgxuRZFiPPsK9cQGVOdzJcrwLc=;
 b=dg0172T8ye+YwTAeKO963jZlShaR7ngf6nzdfVovpSaRpPTCk+94tZni0S7tdghJZq
 urShXxHg/aiFozBCM8hS6D588I6SC9oK3VtOAnPCS6S8d40HQ9rGbfjY3+oiD6zcYb5g
 ILE+NHc3GU47S34jNmFI8XGE1/4iQa22ko4Obs6LdWWCxyh5StayszVTAFgv9JYqO339
 j5yjqmEHjOldlitifDIWNFVba+GhtgHvsHU62fhW4As3IcES00LaxQuOYSDDEt5w5OXF
 qSBPf+Ec1rLCF36WEJDP0Ve9YCPMM0jpaH5WUKTN8+HKME9r5P3zwSalc+FfSn7ZKi1B
 WlLQ==
X-Gm-Message-State: AGi0Puavv3kDbSHOIZej1u5c7/7cHxQ9Il4PsA/ahnkoI2TzpcSxbQxS
 JgOMPnEtMMuxddHDlqipXQWaE16sj/KilD/ctPOxzDrU
X-Google-Smtp-Source: APiQypKnLH+pzozwMd6n8QQNqZT5u4OaGh9ZYxQ3mcFFRsjI0wjMvms75LH9R2xorzvkrqLNBfsx7SJH4kGHIWYIB88=
X-Received: by 2002:a25:8045:: with SMTP id a5mr36172217ybn.518.1587984740947; 
 Mon, 27 Apr 2020 03:52:20 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 27 Apr 2020 16:22:10 +0530
Message-ID: <CANT5p=o8iFSrPscQiqpeX=Qb_JBqiAVGWHsQBh1g4kBBH_u1wA@mail.gmail.com>
Subject: Debug logs in heimdal krb5
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm currently debugging a problem I'm facing with krb5 mount in cifs, and I
want to enable logging in the heimdal krb5 library. How do I enable all the
logs which are printed using _krb5_debug in the code?

-- 
-Shyam
