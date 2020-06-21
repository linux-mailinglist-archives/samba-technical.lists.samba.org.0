Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A2202BED
	for <lists+samba-technical@lfdr.de>; Sun, 21 Jun 2020 20:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=za7Auh/c13e7hoasWuLrUOgN1L4FevRE7XbLeCWxAnA=; b=o9PQmU2pKzs4hMB8GiBle/nZqp
	/4+yuZMJrQ0mVGjrqlynh40qZFHHZaZy80jF1JF96N27Skz7ZuA9HayDnI6GquRY2ogaPBNYFbnXZ
	Yf61yo6l7Kw45X5EmN8lXDuvjFEZCF8WaqmZXVtItVgdrhjKqMG7KYDKfT8S+laVhsSCuiz3jJL2x
	MkHhBmQgoQO26+YdD1T+Ku+JUVyVn41qi8SrUSrrBMHsdgTkvSFR4xMgm0checPqSRsfnc5gc2RBo
	Bil9kfESRtq2QR4wONl+5swQpM7WXFWXlN4gAH2KT+UYvhAMIZkyYhtaSClKSc1Z/3uqUvE5e1wMl
	PV15uvRg==;
Received: from localhost ([::1]:48354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jn4KP-001feL-9B; Sun, 21 Jun 2020 18:04:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38205) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jn4KJ-001feE-77
 for samba-technical@lists.samba.org; Sun, 21 Jun 2020 18:04:21 +0000
Received: by mail-ej1-x630.google.com with SMTP id w16so15607417ejj.5
 for <samba-technical@lists.samba.org>; Sun, 21 Jun 2020 11:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CftEQ5so77m6d4JsuYjJ+ERchUSrytS8eDiaJyLebKw=;
 b=EBjbiM43LK01emXUzXvpLKjk3RXYlwVbRN0FLJSPirpA2F2NEe+lqaT0dAkCgiw0JW
 ElkO+aWAqLM9JfRxUyzMXMoJtOwxhZvuLID4VkVDaXgx56250TTtjwvt7g6dJR80YnbR
 lO1hjevvnUTv+jRVpfTro6uFW2daW90X4tLoaXjdlyvopdnjW30Ypx7qN7weNMH2Dwi8
 RqMnmNsJ0fR7ihRg21ktplyxqqT9hCp8znr3leug4lvc/BGR37rFJV7hAL4L0h8C71+5
 4op3VZ1W+do3xesOapsYdEQh+QZf+lzST+pHKatMfOCd6q1+ZaI0NX2KFn7PPcgXNWtL
 ex3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CftEQ5so77m6d4JsuYjJ+ERchUSrytS8eDiaJyLebKw=;
 b=pk8xU16qwMxH/xjwHPXgaynTL679BUpSu6wECttks+BNPG8fmbyZdo2xfwqIr3QawR
 bMxupCoaO8qAvXvkQBaPkccudG6milO1NsWttOupQE4vVZlBVCxyOSfQUrBToa6Bsc7L
 0Z+oQzm0ko+KiNzqXgAn75Ibx1dUpjE6f/peF0xszoff2U+oqdiOj0HmbVyTKoicoWZ1
 XuYNm//XfCO9gE06Y/w9zwMlBm8gDf4+x2MgkdgYuwxea05ncBeYf8PD36GPdNU8M+AO
 A6Wdk5DF5yRCrWjBcOr5olIrcXUZyo32xfetya8GSkNOP2UEM6k1TSTS6j2xtcWCFJ88
 F1Yw==
X-Gm-Message-State: AOAM531wD4oILXzlv98biM7p7zhpQBgjf9dpBhTkpKtkgehVQ4++GfR0
 Gn+8VVqJ3I1QiHFMQVKZzPPCkLM/1YmUfd6Helk=
X-Google-Smtp-Source: ABdhPJx8rWiAybg74d+dLqFb6+DcTVT7DCezTfKHhFcpEkqDhtP9m19aNzFBSkCZmWfNp8o9VnxJRfL6uomybAf2cS0=
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr3091810ejv.94.1592762657176; 
 Sun, 21 Jun 2020 11:04:17 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 21 Jun 2020 20:59:01 +0300
Message-ID: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
Subject: GSoC: Week 3 Progress Update
To: Alexander Bokovoy <ab@samba.org>, "abartlet@samba.org" <abartlet@samba.org>,
 samba-technical@lists.samba.org
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

During the week I worked on the following:

   -  User Management
   - Organization Units Management
   - Added the patches Alexander recommended
   - Changed the UI of components written in Week 1 & 2

Next week I will be on working on the following:

   - DNS Management
   - Forest Management
   - Group Management

Last Week's changes are in the develop branch of this repo:
https://gitlab.com/HezekiahM/samba-ad-dc
