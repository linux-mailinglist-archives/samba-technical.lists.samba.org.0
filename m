Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A5B34AC9
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 21:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Ih6H5B89zf5LrB7gC79+06NX7fXIlT/IX2o7cz1ISNc=; b=O2lGNdQi4tJv+GMFd/L5gzi5Hb
	Y2W3LK7XMTJfbBTsUEaoBbq+EX3u9WJeOboIng0pI7uVk/2FDup7c69lTAu4wkzvfW6dQtG2Mt1yG
	+2u9u2Q0DUvay2JTopZfkSubnaVPwdFT1ggECw5l+STET20wUrRjWuslvq5AVsOBfJ7NKbt5/ZS2a
	w7Lv4rN2MzDCPHT7ulpW0kYLPw4Nedkw3yahNQBxS0vmDyajPrP18VLK3uxAh9z38CGLc3fehl37p
	PaiTLDsTUT0JcQPFu6/+F8msX1lmEKW1/LoHb28O0kKaIc/Xi31iwdXxv9SKitSDPldZlK/+sdeuC
	QAOPYQjQ==;
Received: from ip6-localhost ([::1]:53082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqcab-000Kz1-5L; Mon, 25 Aug 2025 19:10:45 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:50239) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqcaU-000Kys-K1
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 19:10:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb732eee6so830733466b.0
 for <samba-technical@lists.samba.org>; Mon, 25 Aug 2025 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756149037; x=1756753837; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cHjgww5DpL5w8gEq2WtOGZ6c6JJrUbzmHIVTKxqYVXE=;
 b=m5GMsPMJOeB2DT9qoimwnM/mbZ0CJUpUsc/w7FWYu+Bk2NIR1/d+IM0o0fT83DcvLw
 oM+xoq55UUUl+plpEcs3oP5m3ygGFHpFRZwk/jOWTwllNd0Z5GROa1xKr4fh7RNWledF
 8KPPuQYiUuwwL/eaQryK7juTGbik410b6z4ZQSxomPOIRDVq8TxT4knzY4GNJIYOkJD+
 rpnY4f5uWm2xrKYRNvkPjdssH2Xkku+hVxlPV8aCBscoZqWb+N/vdv6N0fMV1qe73HkZ
 RDKT3B0HVr4YWPXsF3NpYniUoL1Ev5uFJGYL/mDimyvPg1RzVs4jJ4qPR7QnAw5tpux3
 RRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756149037; x=1756753837;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cHjgww5DpL5w8gEq2WtOGZ6c6JJrUbzmHIVTKxqYVXE=;
 b=LiuNkGIVxxwdzSGdmY6qN/LmA3yWnrPQdFNGdL8JWFnLKT1iIbiLQ4zSa3j8UIpLes
 PLosk9VC1dLTY7ywkFJcjGoqh4FD8UzBhZk7V7uy2WqdLTZ5kFWK9enBm7YDKGR6Lul7
 n2YdIx/5WT4W4d8Zy7JfRfB3e6Gvm9XrzQCx8D9uD6yiEytIRCa58kuUc2D5EIP4lW40
 1EH8tdlSZckxp0khRW6F0OsVGDuZMelhFMwUpYse/JS8kOjNcwoq0j/HQDflWuoSOlHj
 FpY3grSWQdvLdGki6JLBevr/e6KjU0cDyk81U674wzA+EbhuaDuUsX6R7MdgRxuIllr2
 73qA==
X-Gm-Message-State: AOJu0Yy1gdNol72Ae8yCXLiAa7ghT5v1SzhzGGfM05tscna0Lg4zvo4M
 APVDFqnC3SozU8Ca6069t9K0oywuI9RowzNeBBdxCYuelM/0KPdO9A6EDMZ2PR12k9HjNtazIBY
 iqY6p7R7eKzTa7ZEKC4YDG8xcBFI4nUR2gMa82Qs=
X-Gm-Gg: ASbGncursEG/CiyMe11+IFR8tvkcx5ThZhKKYingpLVx9QdZQ5yIIJZfLJdctJ2QzOC
 XRLDzpaTzP0LTe2mQkghZHtuB4/PmhBNrGE3ADBr5TwnSpgCv+aK73Svm/G8eNpTADuqoSjBGYu
 JwznluMZI60rwHyAqgS0C2PT4SEhMPsAQa+c/VD7CKzdnH/WiART33iEnDAYKFV452DI4meFhxS
 sctRLLxPwg/BC78y+20cejARzsAN6Iy4hYCNDEnb0KqwYH7jRHJRvGl0TlIM5GFRczU
X-Google-Smtp-Source: AGHT+IFYWnOumJEBqYHEHRniUWGXa5OoeDQJatyUPoUlNTYHDBAVf8Bm/aLlYDKu9F8W4eIxHzewRgoQdBjcFdsQMDE=
X-Received: by 2002:a17:907:3f0c:b0:af9:b4e9:8638 with SMTP id
 a640c23a62f3a-afe28b52ec3mr1235122966b.0.1756149036860; Mon, 25 Aug 2025
 12:10:36 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 15:10:23 -0400
X-Gm-Features: Ac12FXxg2hq_XpuibRngAqjUds790X2Mj0l56qlnzz1Gyxe7o15KSP5LnzzicXo
Message-ID: <CAPfJb3rgf0EWoK=Z6HJ1yvyCzTgJSZ0JcM6mNJULE0nBgkTGGQ@mail.gmail.com>
Subject: Weirdness with Winbind
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
From: Chuck Payne via samba-technical <samba-technical@lists.samba.org>
Reply-To: Chuck Payne <terrorpup@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

We are currently having a strange issue with one of the Samba servers.

We compile Samba 4.18 on Red Hat Enterprise Linux 8.10. We are using
Winbind to join this server with our domain.

Lately, users are reporting they can't log in. If we do either command

id userid@domain
getent passwd userid@domain

We get back user not found.

If we test to see to see if server is join, we get that join ok.

wbinfo -t
checking the trust secret for domain domain via RPC call succeeded

The only fix seems to be to remove the server from the domain, and
rejoin it. These is the second time in like 12 days for us to do that.

Is there something we can do? "

I can send config and logs, I just need to clean them up.



-- 
Terror PUP a.k.a
Chuck "PUP" Payne
-----------------------------------------
Discover it! Enjoy it! Share it! openSUSE Linux.
-----------------------------------------
openSUSE -- Terrorpup
openSUSE Advocate/openSUSE Member
x/mastodon.social -- @terrorpup
dicord -- terrorpup#3550
bluesky -- @terrorpup967.bsky.social
uglyscale.press
Register Linux Userid: 155363

openSUSE Community Member since 2008.
