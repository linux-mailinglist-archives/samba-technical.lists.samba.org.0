Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34183C4FF
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 15:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jkMSOJPY1mjO2PH6LIStA+WjKYtA37i4R/xzh8O8IrM=; b=moua6E4dCiBCZ3qN84OfisVAt6
	kunQXV5t1Z3SSMuIePsSFpEl4troi1VSF5SDVT81POTQAcp9zZkcLBwhGO9aNFrd+/ojKLSZJAYYf
	pmlYxCqU2dLZl29COA//lQ6kT4hPVsDFDaVGIsVGnbxvM+8B4rLrAXhGiPBOfKBRLUqNA6pPLmWFr
	yc6aXw4rXL8Wb6X+7AefpbehuFiJZJTJsTZldPRfExvV/YxuW0FLQmSiCW8MtaevG8Qk3rw/dJO6k
	Oh4JcPCfK5JJu2PfpEd2tVchbNkgB1vh8JOd6n92+lcdWSTj+m7h0ayWjlwaZAqKeb05WpxhgjnDV
	tugYizww==;
Received: from ip6-localhost ([::1]:41976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rT0u3-004RTB-Q5; Thu, 25 Jan 2024 14:40:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:52386) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rT0tx-004RT2-P7
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 14:40:24 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so91490011fa.0
 for <samba-technical@lists.samba.org>; Thu, 25 Jan 2024 06:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706193619; x=1706798419; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=M1bWO5Zy0Zo3cKhKqx63B7ty9KSsgouyKJYZFSoOgvI=;
 b=GuBH+rPGJddP6htHnnsKf8xv+CZymKX1JWw/bDQpvOmAt8lZP78vwuWxnAmusmBIUg
 y7lw3VyjxvY2u+N/tY+4Eme56ARD/xSmlVc8omGup39C6EZZpU9ceHUaZHTYFHj3Nnvc
 OG0ZB1FSxFbGNapUN3AWyh7CK55rtt0B2gHum37ZGEdUNhxonLiHpoQ8ptjKgPhrycsZ
 s+s9esDco782FebcFA3ywAjdWVLTlIbvxG19c4+OJjIvkMysnPPU0k4HXToIjE7pT6Hp
 0s9ZIaLRTI5TOyeyoEW1YY+RCysqzZ1b2xf01iW0pEgIu5Y1UtxCcymO9kaM877f3rmw
 w8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706193619; x=1706798419;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M1bWO5Zy0Zo3cKhKqx63B7ty9KSsgouyKJYZFSoOgvI=;
 b=FUDdptGclycyR8TaKMEXVJO3eJYkutyc+YfapI4LWZU1QPa2hczy0A9El8AVf+Bduh
 H9bDpYpF+z0VudskRL2AET+pJfYruSUV+NHSNoTSNk0uW4kG9LRggex2+WzK0zMh89mg
 UvzlmS87xsIQAwOGkEMh8QVJUKlh7BdqvP9j2XwHa0qe+K5tPRv6yf5sLLeCOWBA9SoO
 7F2v3etTz6hcQ/R1ukwrLXs9z7ayFpHpaBMXXr65zbmM6zWOpXdsQpX4NItrKJ5klnc3
 4S4zgZQLdZPuUcqvqPQe4dwFNS0kmRbYtt94jfAa0uE9A/Z0zkSJhQ9Ng+piPHR/VHu+
 ulJg==
X-Gm-Message-State: AOJu0YyTe418EICze1O9X69ljwXI1bv+J+piHNOQa0NfwA/uGsfcF6tO
 CeGoiKXOKJxEUbt919U1u9df1onqVTixAarNxNCkEGqQvFo71QfyyOymDdKoyEYj1ZuMsTvbZ0W
 bjybETKfnsYZLrNM5VHyH1M0uE8SLWSKslFlM9j/P
X-Google-Smtp-Source: AGHT+IF9LqAjtCGmLmjhdwkYgsmpBvh9tsnAt5SoAwiNYHZRbg6KS9L9+xJ/tTNjZk3AT583OaQVYUUAvg2zA3aJyQ0=
X-Received: by 2002:a2e:3c03:0:b0:2cf:2449:744c with SMTP id
 j3-20020a2e3c03000000b002cf2449744cmr760079lja.9.1706193618962; Thu, 25 Jan
 2024 06:40:18 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 25 Jan 2024 22:40:09 +0800
Message-ID: <CAPSN9iQ1GJAU1oQTpK2k+z968X71NuO_932QgRPcWS55imdb7A@mail.gmail.com>
Subject: Order of getpwnam call in Get_Pwnam_internals
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
From: hhyy ww via samba-technical <samba-technical@lists.samba.org>
Reply-To: hhyy ww <hywusmb@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi List,

I have a question about this commit
https://git.samba.org/?p=samba.git;a=commitdiff;h=ea4a0d509ef70e91baedc5eebf4f4bcff10dac96

Why samba change the the order of getpwnam call from
origin->lowercase->uppercase to lowercase->origin->uppercase?

Without this commit, what kind of problem will heppen?

HY Wu
