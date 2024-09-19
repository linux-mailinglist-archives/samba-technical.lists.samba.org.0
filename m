Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7654697C2B8
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2024 03:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=nrkkztT7w1cV9Fu7bDVSJQ/4r3mWFA0eqS0w90TAvVA=; b=z8MxVQ9U0x9xegTyIG8dQ2LtHs
	mBEPp8JHiBqr/iZwss/X5iff+ETJlnnSFgEMd8PjxhhVLR38+j3JF81WRts3KTXAi9xe0W7L7/Brb
	sV1Hg7ZIlCm7WW0N2IRMUrHS8gtMatS9DLTjfihopYoQbU7qeatNzgXVDPYSSKyCuJl3VPpfzENGl
	/o8wqaMVvym2nB1lIV9kl5HKaginoONk2Ke0jazFB1IYeMILZuyqXg/Fekbw0twLAl78DNfFSP43g
	O5YeUXKmiHdINWzdhcIE0P+bj3EhMOT+t5OOWAEsqYPDDCPw5bzjE1I4/e9RnBKbj2Qqb/v+plCIs
	Os3mTSaA==;
Received: from ip6-localhost ([::1]:47178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sr6KE-000Ikk-Tn; Thu, 19 Sep 2024 01:51:18 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:52418) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sr6KA-000Ikd-5H
 for samba-technical@lists.samba.org; Thu, 19 Sep 2024 01:51:16 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f761461150so3566301fa.0
 for <samba-technical@lists.samba.org>; Wed, 18 Sep 2024 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726710672; x=1727315472; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nrkkztT7w1cV9Fu7bDVSJQ/4r3mWFA0eqS0w90TAvVA=;
 b=FfAh7Trd3BJt+zfhJ4m1ZNp6x2kO/W9eUxiKLfx6oHDfGkYfKS+bTVXJh2txk6UrwM
 DF7GI/sYj+zNVXHeIW9yyv9a/6KKNMVuKEg/kO59OUKzNNKrkaczxbQJAcQgPjXqiQph
 MxvK4STq/GecAqhrZWcMB00nFrHe9d35OvJRFRhc3qSEfIGDuaF7ISom7q+L05KpUW+5
 +Tw/VJ5R9KcJhYMs5iIxeaVQJhu8uBNUJBohbJE7t0ITnVEMIcK9iV7ifyXodkZGsx1E
 EJGu3pnCp8ciiucdLXJ46tPuhQW6K79OJeGiDWz+I9n6gXOTniQCSwXlEeUICj/jcrp/
 QXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726710672; x=1727315472;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nrkkztT7w1cV9Fu7bDVSJQ/4r3mWFA0eqS0w90TAvVA=;
 b=YVn6XWLiQOViJyI6E40vSqtSmI74u4+iPYhs8qMZnRM+KnoLfAvpuZbBcM1saP1BfP
 3gKHjqk9RSBBFoWvyg9hQu5o80H3zC3HWZRdaM4/zo7FXHpekadf9o6N731sxv7RiIuP
 BMIRerIySrrc5HyDQlblQVzTda5YUuxkAXOo/G2OuiBWunjLm3/BQdIhB0g0Fr1BlYrV
 +py+F4+rrcwiI8iIV6DbAqOiGlELKImt650+gi9Ldp93jIAUS169P99CqCtAjaxOcVqA
 seLJD78tr5iTUHvV8wwL1m26AnJaQRjuEDXeDo6IhJd+GiHVK7roKTUkqtnG3X5gSiqg
 328g==
X-Gm-Message-State: AOJu0YwU5xatf5sB/uJRhKfa6Gjthx8a005By/FbCz4JNMu5+MjubqAs
 numQhrRC3q5zzR/eAZpiuX3aUPt0RqIK7y/oEg6D6rjeuzwGoktgvY5sAo/4xyo23qBoM4shsT2
 CeUvRTshd2k4gYb60NaNL90i2+YpDcMhL
X-Google-Smtp-Source: AGHT+IFpGEeFclUOdQxNulFGUzQUBciA+e7DYlBYWLs133x9rnnGvxqzaMgrhSaCsFmoZ165O5PpACDMDzil8JZIgWI=
X-Received: by 2002:a05:6512:3a8c:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-5367ff24cb6mr13029182e87.38.1726710671851; Wed, 18 Sep 2024
 18:51:11 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 18 Sep 2024 20:50:58 -0500
Message-ID: <CAH2r5muLs97YW12d1C4TWS4wHF-mbphVJCqzVe9LBNE6iYLPKQ@mail.gmail.com>
Subject: Network discovery of nearby Samba servers
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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

Today during one of the presentations at SDC, the Apple developers
mentioned a tool called "Bonjour" ("Avahi" in Linux) that is used to
find nearby file servers to mount to.   Is this (Avahi) possible for
us to use from Linux to find nearby Samba servers to mount to?  I
couldn't find instructions on how to setup Samba for this.

Ideas?

-- 
Thanks,

Steve

