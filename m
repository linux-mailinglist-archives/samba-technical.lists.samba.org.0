Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104C311AA4
	for <lists+samba-technical@lfdr.de>; Sat,  6 Feb 2021 05:04:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=o3BbgoXGbQ7gGYCf9obyMH4h/THtJTJmeGwLkiM/RXs=; b=MYCHN8pXFXOF4Ztu3rI34Hl4p7
	SPXapi2rS2fTZtOxZOg7cxgQ7860e4GtXgX548tN8D/uA8kxbG/Y3Gk595qzR4N+6Lzp1ssp7xDf7
	AdCddlHdRmg7awHqdAAru23ij+KaDP3wWs0QhFMWSKqNMvNrDKjUsWquaERIoVGoKiEQTg+c4dAQM
	TUQn0DsTujayoXJn7LMcr1Tk9Mhr2oJrt7q27Y1n/DAiNc3ZdB6ebHvqm/ttqbjSvqsCoKBKS9l7f
	oye+kAz7bcv6AD9FLCQmnUnK83kz9lVOnBg4bTdVhiWl7KjlYpfyOOCD2fLBJbWh2BwcuMYvC2bGp
	glkxywDA==;
Received: from ip6-localhost ([::1]:18858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8Ep9-00BBhi-F7; Sat, 06 Feb 2021 04:03:55 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8Ep2-00BBhb-NL
 for samba-technical@lists.samba.org; Sat, 06 Feb 2021 04:03:51 +0000
Received: by mail-yb1-xb32.google.com with SMTP id v123so8761193yba.13
 for <samba-technical@lists.samba.org>; Fri, 05 Feb 2021 20:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ARVeO14hVjnenk3LtGGxkPSZ9xPLcLvSsepAkdkwjtM=;
 b=hQ+ST7iI8dciOgWpdTDWY5Q7VOBHKsqGXXQPSxwV3Ra4WBRHPavxJS1xXb9EgTbxkU
 1vPh2iRyy/3b0opFGByUL9Y7+FwMpE54SG4SLwGLE+X0RAYbhe5Tjz9AcC0W8ua8QNSs
 8tXny+eh7yds4bC5hQtKVGVNvwMHK60za/C8iHamxD9/IvYZ4jdyK2rVrZQ+/8/+n1B2
 iqmpcnrnNiKwi5Nzqjw7MChC88jyZrv9krgX8oim1dZZSh4vNc7l/vG9JjVlIc/rVKRw
 6IObr+6GxN58VI/dXd/BWZ6AShIhNc4nwwAa44seXHE+U1FISD/6b3dLcYZnXkRDmQXA
 E/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ARVeO14hVjnenk3LtGGxkPSZ9xPLcLvSsepAkdkwjtM=;
 b=FEZEX4vLskMgg0u8qzGcpFZN5Rxsfmzi1P0wYD7I5rMjFwRWYqL4Or4nrJdWNyF1GU
 Qtb1rW01oHmVvQQfTfkwY0vjLQAqT1toAvxiE95Tb1mItXLAwacBqdEv8I1ky492f9sv
 Aixrc9KRHl/fRXyTrMOwBrK3MXysfBEUpIRRXcF51vmNC9pZjw7aNpY+MH8o+UyIMbrX
 pQA7lB+2wEkxxy0y2g/GrBRZvUXM4zJ5UxlVFKg/th5A8rQHvPXHzduMd+gfcy34taHd
 35hcEvqWTI4/LZnHJLWlfjciSMtq2qGTkNdOYjw45C7JwwOLe1cjyRNUheyHMQ7bGVKd
 dGhQ==
X-Gm-Message-State: AOAM533aE34I/XSkf/MYB+gU+nAsMJkBIjYlP1WQqTEpbXekH4UICxWv
 fVezJCLk9sl4n/qylQd5vlmLzd+KaSyezvuVahEmFTvW
X-Google-Smtp-Source: ABdhPJwoSd+gUSb9xFPpvz0+ZYPkTiJ7Wii5B1g/gV7N9j/BDKnHmjGZiPXECIeX1VU1Ltwkqq9p9vY7mPV76hy35xU=
X-Received: by 2002:a25:37c5:: with SMTP id
 e188mr11268511yba.283.1612584222070; 
 Fri, 05 Feb 2021 20:03:42 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 5 Feb 2021 23:03:30 -0500
Message-ID: <CAKHbFk1n9tsr9hwBqLtXQid=zm6BOYbeeNhdcRMdK6pFQFNg-A@mail.gmail.com>
Subject: Certificate services
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
From: Thomas Epperson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas Epperson <thomas.epperson@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

Have there been any efforts or are there any technical boundaries to
implementing the certificate services in samba (as would be used with
active directory) ? I am looking to implement it and thought adding it to
samba would make sense.
