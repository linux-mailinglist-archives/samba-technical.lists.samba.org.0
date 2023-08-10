Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD4777137
	for <lists+samba-technical@lfdr.de>; Thu, 10 Aug 2023 09:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=HvH42dUlubBMm0ryqS2TOIl7aBw86JJE8vPn9bwwG24=; b=gEaQ3wpktltQzxPf4NXTabH54L
	JkNqofdBemL2kSB8XGt6S2tieQ24UsAT2odpEwRLzStRL/1cJfWMvUDnJSBKA5OLTRyRTTUZMpca3
	ElGK/S48YSS4pKoI86s+KYS88yJEq0+gtQgRvS4T1b6VVbcg4xxf8gWCarQif3nMZfxAbswDeKYVs
	NbXRNmKNSL9bV9JdnHsNzA21xwbw36KphB6IUoJFtkC/LP3STiMZVoE6hGs4TtCCi7M8eUaJ8GCKd
	XHpuM5VEpahvgWDASa0UyxPuPyuoR9PWZ9ajU6jT5S/gqg91Hd0jpZWY6hTU4il5Dv+QGCP8BORmo
	/BLHZpzQ==;
Received: from ip6-localhost ([::1]:50156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTzzD-00BYZZ-Fp; Thu, 10 Aug 2023 07:21:35 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:44378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTzyw-00BYZP-1B
 for samba-technical@lists.samba.org; Thu, 10 Aug 2023 07:21:22 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6bcd4b5ebbaso577153a34.1
 for <samba-technical@lists.samba.org>; Thu, 10 Aug 2023 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=har.mn; s=google; t=1691652076; x=1692256876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HvH42dUlubBMm0ryqS2TOIl7aBw86JJE8vPn9bwwG24=;
 b=MirwHyY7kkvPWQptfoHmqteiZbK7KcIosd2/SDu5Pe1Ou7CiU/RHnVu4YpH10N8mDc
 tmJbEMiqScOIhPeqrhjaOPyi8ugcHV0X9ZUON3gob0LqSxAyEbBsr/d+MqMrrEKxqWQL
 sknBx4uhbvlNRVdS8w/AxkjONyn6D4SCh1EivZ+X3ue3RrV2OJPl39B6mJMOH+JAWcIh
 //uy/Pk3DLYLbKwjcMyYamm+T0y2b5LBXpsT0BBkYTtT+eCNvgNtlOSHJbivuRWLbZLM
 JKGoE7rFx2O79djUf1AdaYKq5hksVLLp9qop7AVXbmUNMli3mceLwyv8abWTVMyCZvcZ
 zhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691652076; x=1692256876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HvH42dUlubBMm0ryqS2TOIl7aBw86JJE8vPn9bwwG24=;
 b=bxE683Nx2rI7csnI88eRPpS6YwoRPBmOFEmDBOdlAmtXWPux09/yUh4dkuAqP7Mc3Q
 JxF+xFmWF2bPdOJ8sn0stQYRPHwgYaHxMU9louvDQEqAsQMrh5O43nCzGz+wBJswkLRU
 RTlBWtNz2xr7ngsVb2YB9cKvP9yfaaxAcgYgv5BWSARjkC2u26nlFHWV8DEmkL29f63y
 4LLfSoP0Wr05cTv5Kbf3/gwGu9LSIlT5gyLkcem4wYBbrwy2PZOSQNYLf/bZMW8LUYue
 ODYCWEdqEFiwBM9zAKI7hAnV1O/RLWYRRALoE2baCrAOF5S5eqBO8iWAlQ+Va5V3igab
 S88A==
X-Gm-Message-State: AOJu0YwizZoPdDPvng/+4SyD7x6QPxzzdMuHLX57X0xnlKHXgC6xkqk2
 gmuqBQ83oaqR1zzcnHmkz3ThDQ==
X-Google-Smtp-Source: AGHT+IEWudtIuZuTvRG8Jeh7+YS9QDl+hW1X+NxXO+5DqighQw2IlAJSuIZBvKoWO+I4zQxL+PErkA==
X-Received: by 2002:aca:2818:0:b0:3a7:b5ea:f5e8 with SMTP id
 24-20020aca2818000000b003a7b5eaf5e8mr1609870oix.27.1691652075831; 
 Thu, 10 Aug 2023 00:21:15 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902868500b001bb9f104333sm880561plo.12.2023.08.10.00.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 00:21:15 -0700 (PDT)
To: sfrench@samba.org
Subject: [PATCH v1 0/1] cifs: Release folio lock on fscache read hit.
Date: Thu, 10 Aug 2023 00:19:21 -0700
Message-Id: <20230810071922.30229-1-russ@har.mn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Russell Harmon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Russell Harmon <russ@har.mn>
Cc: Russell Harmon <russ@har.mn>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Here's a patch that fixes what seems to be a showstopping bug in
cifs-fscache. *Any time* that a fscache read hit occurs on a mounted
cifs filesystem (and therefore cifs_readpage_worker is called), the page
lock on the read page is leaked, causing subsequent accesses to the page
to deadlock.

I've been running my machine for the past week with this change and it
seems to work, but I'm a little concerned that this may mean
cifs-fscache has no users (besides me). Up to you (maintainers) whether
that means you should accept this patch... or delete the fscache
support.

Russell Harmon (1):
  cifs: Release folio lock on fscache read hit.

 fs/smb/client/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1


