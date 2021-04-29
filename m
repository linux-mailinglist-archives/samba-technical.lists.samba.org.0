Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EE36E29A
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 02:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=R5iTZUVf0ziACN6bNz65gA1dZ+ghLAqRXFYs9970IW8=; b=GoihqyoOphdeWLXljkpAUlGj8S
	Q8Z4IQ+K/z8AQgy+2W2Swhvk5GdKinWOJJmGAaXWdNpQsLFVcYuX5F4xZLIGpO6D1UlvUA8iI+DXJ
	B2lPq8Rd/gdQS2i6bF+fJxWpna0aGUugm+Kisc4KaH2SlrbmIRSujkk7ezzEP0YGq6U0QR+svZbYC
	pzU1h0O+qNSxJkcxMPdWIzwSFOcHy1o+6t7aDUIXRVjFfZ6B1ike8pZiJ5RTUuI25VRlfChNXTQCl
	/XGNeBhOFU2fwf673NwlKQ+JLOP4nNyIoozFR9Dcyky5uy1EDDt1mFhrS+Rnc9M5OIOw5yBv7A8jx
	uMvpvL7Q==;
Received: from ip6-localhost ([::1]:59482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbuV8-00CxeL-8B; Thu, 29 Apr 2021 00:25:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35659) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbuV2-00CxeE-Rg
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 00:25:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id a4so64952201wrr.2
 for <samba-technical@lists.samba.org>; Wed, 28 Apr 2021 17:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kWC92iSjSc/hlzD7HEheK+I37MoRDUKqq1bv0y9kDn4=;
 b=LwuEbN0xs/PazEv4zC7dHDzH9PgsXToqZbAO8/LzoRh4tf8PjC41U9i4KFOCcay56h
 Znh3aFb/CSkq/7PzleGoqCY7ZmPg9qmDikZ6jdzt0bjZpLeyxraZp8FC3QXasCBTgii/
 EOdDuPfJP2Jg8EHLGqzSy7FAqQO/gUEt6TelXah97jzi4LiHh7aN2DfHZfwYlQnb4tKx
 qV5ZHBFQGzXzbagBN97w4M2sAPFlVrqrjRBdIOFNiPhGNHA2o+MWf1benZLHEgJgeF+u
 830E4LgRObumnMByDGyepc+yAH4YgnxsV0tJVoSTgBd6XoFty0Aa6OhRJPSTGmjJ3riv
 +GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kWC92iSjSc/hlzD7HEheK+I37MoRDUKqq1bv0y9kDn4=;
 b=iPyDBfhrPgzETlxrC65hS1VuvsznG9vAZetdhzyDeiMYaGqJtk9ZZDGaufuV7NZgp6
 SEDY9YOoEVxJA3x3Dlr266L6m1RzlpHKjg9hGPH/ytYt1IcLKuxuDX9vgH0Yhe/ePLrm
 uVQAwHYjqMo57+J8GuGxeY4rDukd7y8N+xBVpnv+Wu/A4u5xWXoivB1udGK3Q2XQm/NX
 l37ptSlMs384rhHVLwqGo1ZBUndpyvQ418u/AdMKb6Pp47JSDW08UkZJPlJWr4J2zI47
 Uwbl5FKOzMIMH6qJ/2KAXNAyKldtuKHO4Ofh2DZzqK2+fzPlf8zwt0scRJ+SUX+6ur6F
 DQVA==
X-Gm-Message-State: AOAM533RPPt8KbjxHx1ggfrKSA4PgNkFbbg7euiHc0I8TnE/XQSPiqQn
 fCyXc2HKxA214aQVOnXQHey3NJl5OJ+xKNwKQMewGpsJS3hHfw==
X-Google-Smtp-Source: ABdhPJy8YVukiRHvXoUT6yL5V4FA2WpqVfahu5w5Dg11o5ww6GqtEtMoaC6/Tg4fzYE8AtJEdM9AD7V+cqhXr7MTv2I=
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr38871466wrw.379.1619655947359; 
 Wed, 28 Apr 2021 17:25:47 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 05:55:33 +0530
Message-ID: <CAHbM3qio_0K45DZbK5aYXPE_QAkku8K_XBpFxHQWksf=iK65uA@mail.gmail.com>
Subject: domain join stuck at krb5_get_init_creds_password
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

In one of the cases, we had a situation where KDC was not reachable during
domain join. In this case, we found that  krb5_get_init_creds_password()
will be stuck for about 6minutes. Is there a way I can reduce the timeout
value for  krb5_get_init_creds_password() so that domain join will not be
waiting on this call for too long?

Thanks in advance,
Shilpa
