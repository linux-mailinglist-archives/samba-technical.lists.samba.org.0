Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAE1115644
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 18:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=aVfoLoCfJpKymmgLwDkjmSpVYIXUlTZXT2AsBOWW1tM=; b=sEzyohoXrhZLDcE38MLWAyke2i
	sdugwnzRUynIRWatCas8MkCjOoWwjZTb963rPl/B8hTY9B9x6iJi8nSch3qOzDO/pkj49nX+xuRn2
	EpjaxajPh456FQEWx7nldQoCfhUqb3inLwIedyUGIEjtP5+QUXrI7+UbBn3pXqFy/UN+IvcO8jYMH
	exQvpUwxOCnZ6hD6Be61hI7znvgdJmw54UYxvDSCpIS+ln68h3CcO11JY7fPGWmCeDU5pR/P1gNOY
	kdK8ETEkg4cEYPprJKz7XELWWpg2xYIcVOcNvY5j3ZA6cn9KiFh7w1iw8ZM5qVr6Y60HZF5oPdKUV
	vExIn/wQ==;
Received: from localhost ([::1]:32446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1idHC1-006REH-Cv; Fri, 06 Dec 2019 17:15:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:43602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1idHBw-006REA-9w
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 17:14:58 +0000
Received: by mail-il1-x129.google.com with SMTP id u16so6845757ilg.10
 for <samba-technical@lists.samba.org>; Fri, 06 Dec 2019 09:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aVfoLoCfJpKymmgLwDkjmSpVYIXUlTZXT2AsBOWW1tM=;
 b=MbGokAL/PrFi7zCGS+H9oIKHOe0JYfA11BUe7Fzz/1iJ2IcqHsKPCLtoBXMeIevHtf
 neBoNZgm01U8bSsE/lTrq6Orbl2RDcLOwYRgco1H5WBLVt+x7db8mC29dgBka7LqbqXh
 LSr7yq8FemkFU5flvvNcTNkLpmgIEjBBHv+j4pc+00XetpO5asUCwME/PypNYQV1DIqS
 VE9+kQvQr+ajpVUCxQrPquXKN/H73I/h1urnqU46dGeAMxtV6SYuQGLPblhiBXWZq9lj
 y6Bh7vCQJvHZ8icmgpvDFrlKfDSg572VY4s9HKjnU2bUU/McYxs7mG1q10uDQHY3cy7D
 qonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aVfoLoCfJpKymmgLwDkjmSpVYIXUlTZXT2AsBOWW1tM=;
 b=CaivgHfNx1yLPsDzD52UjoX6lZorJWLhPVEu8uPYFCIXKn4AdtZ/eTedRm8pRMrpTY
 342fqa/guIoEAORQ3q+iKLZvI9YO4ygFcg45msCM/gQdxXWIIB+Jy4qGGKMva3X+b4qf
 xOuuGY3gLUIQ7OfvUHXGV+mwrY3tywKl7UZPRaKsQlj1G5lW940hcvnI9wzlZ/KfQg5O
 H9bJ25jizHZFRZWAHwUnyt9F7poHKtzdC+Rf5mfYEuOJiolHgf4z82qvGxaigZIX1Dop
 4t1OIaqYvYntggXCM1Eh0f9AKgrGJ+7cUjlD5qm3t/IqoIxpE9/RDjacfiYBQOIKnUkr
 7ZSQ==
X-Gm-Message-State: APjAAAUr36Ch3zEl6m1Dg/qGVA5g3C2y8uNgfjWG89bVZfb57RAyYoT0
 qPIfAtmDZGqRj5rqG2qAZd5jjclHkA2f9jr1o66xiA==
X-Google-Smtp-Source: APXvYqz9tweXYrmYX2R1MOnVodpRdaM11QnAH6qIRyKW0I4HWblA4qXyiwYHDI1QE3+GeaVcp5SyeAvodUtoDBXrqeU=
X-Received: by 2002:a92:1607:: with SMTP id r7mr14725438ill.272.1575652493954; 
 Fri, 06 Dec 2019 09:14:53 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Dec 2019 11:14:43 -0600
Message-ID: <CAH2r5mve-AG26FVNQRZLPO5pqgkGLDkqN9xQ2=hh90_QzUWHAw@mail.gmail.com>
Subject: Control fields in Security Descriptor
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed a Samba server bug when I was debugging a problem in a
client patch I was testing.  The client patch was sending the
incorrect (endian reversed) Control flags in the security descriptor I
was sending to Samba on create.

I noticed that Windows server correctly rejected it, but Samba server
accepted the security descriptor with the incorrect (endian reversed)
Control field.   Probably Samba server bug to ignore validation of the
Control flags in the SD.

-- 
Thanks,

Steve

