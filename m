Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505AA1662A
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2025 05:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Ht/7JrZvNU8ftTsPo36AkZgE+47tm3VX+1z5S9frgHc=; b=SCoP3RCi02m6EeCE/Ov6oYwxFq
	dibuhOpgigvH8xhjECLcx2K2V/onv+nzafjhydAEHb4O3QWPPbMQWDlneauvTUfd63oDs2jJ40Wsf
	QMI3JjFZ2JfM14Sju7AptCRO05LWg64dDAZP+jlPwSfJcAz1pHvYjI/gaBGSkvmBrF/N3aQJp8eWK
	/EsoBD3u0oSVjDEVeJJnWV8hFgKuTySbxmIbgeYl2yfTu/5N4YVIw0KXTvBYvkmvAuVOcXuX5hHY8
	ed4Nx1cYjwmq2DLQ69UynLyRtX6+PCJpyyVfPM68QR222GMg+Ut3BRte2kPu0HmWATzEqp9siDoYI
	9vLsMH/Q==;
Received: from ip6-localhost ([::1]:63220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tZjjK-008gju-8L; Mon, 20 Jan 2025 04:49:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:53550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZjjE-008gjn-PM
 for samba-technical@lists.samba.org; Mon, 20 Jan 2025 04:49:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso4462570e87.3
 for <samba-technical@lists.samba.org>; Sun, 19 Jan 2025 20:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737348574; x=1737953374; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ht/7JrZvNU8ftTsPo36AkZgE+47tm3VX+1z5S9frgHc=;
 b=GjoyadNleb/Aaaz/Gm26NK5qCiXN2BgeztdvSTe3EQrAPg5lMXjPAxQGd4MF87YPeo
 8bzDVN9Wqwn5KMDMJW4DiMAJeScfyqpiV5xyp3KnMwRIrkE2HLDuvl9+jaWM1hUClW0u
 TV1NeDBUmXAnIZw2QnaCy683/54dw5gvc+k1lPKsfVuTgoNcUN2t9vwTcPr99WUtqVHS
 Q6UIalusbBofIVXM2yTmf8gGdG63nLIm7yD6YSww9/dZE58zgyhDgCsAllYYenq+B3so
 tOktPV78g5o/kQJJW8dRWd15T7jL23ToWzbX295FF1mL2+Oresp/jCIS5A2IDju8rDy5
 v37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737348574; x=1737953374;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ht/7JrZvNU8ftTsPo36AkZgE+47tm3VX+1z5S9frgHc=;
 b=a7i4Tesz45cF//ILEywzGWLt4uWabysR0hnecOLwtnLukw54ImzsGKFVJ1tZUhgxTm
 imINw6cPagoUZCByJLQh59T7Ws7N8vra9xbyrK7ZXViAHlrqRbGGwlXHjgIhfmbwSOfS
 jlnZDUUAns2M7iDRNfFcZ5xqsR/and0FkCR2v0iUprBiAaMeCmKu+sUHslAFoJdc6K78
 2LWfQK7mnjvnbj7eO24IMNi02goyeFxCO6kzcZGEgTFez5BSk2lVdzFiuQC12g73zree
 ph2C0HHNJ4D1T/BYII4glSZAlWVHCo529aH/U/1PdTNUzaiPJT4bduEF3UgzLrEZY7ZF
 /yYQ==
X-Gm-Message-State: AOJu0YzlG6OJ7RiBZolZURgBw7bnJPHIpnZNjG0zzTvtD5sAQo/VSOmm
 yoT0u4IU8ho2Ppgd6WGAKBhTIkFUPokVHXZd8cj5km3SsV34XrN2UQmDr5ulYbSI0p2/KBVSI89
 r2t5pC5JU1A3nsEJA04pa5RJprXzgxg==
X-Gm-Gg: ASbGncuyhCU8fBnYlL6k++q0SOjwEsCLmtbdkDjqi5CCOO5e8chnPF3wp6AweAX5QLl
 y/pppNRzWxrEJFaIGqimzMBkNM+anYcrVUdB43GJesYVdCX6nGcs=
X-Google-Smtp-Source: AGHT+IH7bndLjqFb7y6TlaBQRvnCn1qPpDGR4y6OhBdS2cF8PFuvaaytI3fE0UcOx+igLuPEkn+6PD/FZ8kb8VFFb2M=
X-Received: by 2002:a05:6512:124e:b0:540:1c16:f2f7 with SMTP id
 2adb3069b0e04-5439c2478cfmr3628527e87.14.1737348574339; Sun, 19 Jan 2025
 20:49:34 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 22:49:23 -0600
X-Gm-Features: AbW1kvZ3EWMHSb7gZWHficEWG4ZAhVNOm8yYF5LD7HeuU0jUBqYsMS4WSMz2TRU
Message-ID: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
Subject: Local KDC and Samba
To: samba-technical <samba-technical@lists.samba.org>,
 Alexander Bokovoy <ab@samba.org>
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

Is there documentation (or example howto, walkthrough etc.) on how to
setup the new Local KDC features of Samba server?

I wanted to try some experiments with the Linux client to make sure
the new type of krb5 mounts work fine.  For the server I am using
current Samba master branch on Ubuntu.

-- 
Thanks,

Steve

