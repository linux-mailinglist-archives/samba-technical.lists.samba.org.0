Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A68777138
	for <lists+samba-technical@lfdr.de>; Thu, 10 Aug 2023 09:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=88gUYIJkJYKMx1oOiBngjwpK9wFuxdelofupUObZAsc=; b=e60jCKqcHFPDVzLer4VwAqmZmg
	b9q9iViMcB0WRoItffNKqmTjNHJybp3TzOlvtaeeca3f9uLVdEZNmpbeIhPY7q5EL1bni7LhwVEAY
	4eVZNzV9U9Zo/3AoZbAZ++WkV9cEJOJ/ZL/ho8AK1HtdxWEOVQ23FEqorJCBeX9Lw0YxNVhVTZFln
	yyV51b6hw4iCZ+8KUwdW0ONWz5VcyvWco3sZ9upvEu1oqopMTZ992gUP4oqUtrIgMz+L498YI6qMb
	LEuKTjxiQ3ZIiGMoxw8Ipn2DnvJ8OSsIAKYLnh/2y0C0DMLN+KWVjDYMBkT3REGb3x5lQs8DEOsYo
	jwDxu0CA==;
Received: from ip6-localhost ([::1]:51326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTzzJ-00BYaI-VY; Thu, 10 Aug 2023 07:21:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46508) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTzz4-00BYZY-G4
 for samba-technical@lists.samba.org; Thu, 10 Aug 2023 07:21:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bd9b4f8e0eso3191725ad.1
 for <samba-technical@lists.samba.org>; Thu, 10 Aug 2023 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=har.mn; s=google; t=1691652084; x=1692256884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88gUYIJkJYKMx1oOiBngjwpK9wFuxdelofupUObZAsc=;
 b=oHlU6zDG7r8Dmy5tCzhi1rfg/TsLidKHUsWMjb2OH2XC3F+FiORH+gRj2kw+44TLHz
 v+GzRntXPXEp/9RxvjXGbM0QFoMALZqecUjGsyaMyMrQsEPRv74P220R7G1dsnPxXXRx
 Q4yfSjIfbSQlWMqnaato60tMfK3GgguLXitNk6XlMFEniBjU/g4ctLD5zIYEdysO2kjE
 4WBHS9dzeEhuStyKkpIMNQ0UW8IFtg6dZzsx2CDr8oTN3nEFtdczD2NVkTRqS/2T+kV1
 BeKcS6LcNgF9QQmXovSbNudlAR4ABeJzMBCNvlXy3Rx0/wp1i0SVuoWQJtciTI29OrKT
 pKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691652084; x=1692256884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=88gUYIJkJYKMx1oOiBngjwpK9wFuxdelofupUObZAsc=;
 b=IBUDAgMDXTytVdn3e5Jk3zF35bKCdBbhGYd4RgRWiCGO9xl756T+uukeb0calthOKs
 JtUFwcbWX7jyrI1nO8LIrvYL3soMtrQhqC5d8XmQoCCIUhiLxUaYzMylKqRgFpKaa9iS
 UrDSeXuvkpf8ShMQqFtgdPshAo0p09KZlAGVpDq8eGzLCmGaQVFy7Ps3gldotHrFnSBm
 FwrYnff8DAVm6dl3fegTFwhK+KLoN53+szJzMClGLccpOo4MN+VbhmYyOunHjVM8PUBz
 wnsTLY1obLLS7FkcloIEhalDIEpqp7E8JCre9ETB3Lv2DU+pDOvcuY5W45Jb2XZsi+Zu
 PS+A==
X-Gm-Message-State: AOJu0YwENQY9DPOJhnBWMRiLYWEorPjhKy+aNrBkKFyNEuOF4vnSLQMM
 A5pcywR+bs0PCOfbzQikbkcpUQ==
X-Google-Smtp-Source: AGHT+IFS3RdngNcQCLh5I4/mZEFhmcaVS6zrbm3tihvuBvrjaOP+7xhS1fOj2rm1KLVcY4g+Pf77Ug==
X-Received: by 2002:a17:902:8692:b0:1bb:a6de:8e49 with SMTP id
 g18-20020a170902869200b001bba6de8e49mr1171972plo.9.1691652084052; 
 Thu, 10 Aug 2023 00:21:24 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902868500b001bb9f104333sm880561plo.12.2023.08.10.00.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 00:21:23 -0700 (PDT)
To: sfrench@samba.org
Subject: [PATCH v1 1/1] cifs: Release folio lock on fscache read hit.
Date: Thu, 10 Aug 2023 00:19:22 -0700
Message-Id: <20230810071922.30229-2-russ@har.mn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810071922.30229-1-russ@har.mn>
References: <20230810071922.30229-1-russ@har.mn>
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

Under the current code, when cifs_readpage_worker is called, the call
contract is that the callee should unlock the page. This is documented
in the read_folio section of Documentation/filesystems/vfs.rst as:

> The filesystem should unlock the folio once the read has completed,
> whether it was successful or not.

Without this change, when fscache is in use and cache hit occurs during
a read, the page lock is leaked, producing the following stack on
subsequent reads (via mmap) to the page:

$ cat /proc/3890/task/12864/stack
[<0>] folio_wait_bit_common+0x124/0x350
[<0>] filemap_read_folio+0xad/0xf0
[<0>] filemap_fault+0x8b1/0xab0
[<0>] __do_fault+0x39/0x150
[<0>] do_fault+0x25c/0x3e0
[<0>] __handle_mm_fault+0x6ca/0xc70
[<0>] handle_mm_fault+0xe9/0x350
[<0>] do_user_addr_fault+0x225/0x6c0
[<0>] exc_page_fault+0x84/0x1b0
[<0>] asm_exc_page_fault+0x27/0x30

This requires a reboot to resolve; it is a deadlock.

Note however that the call to cifs_readpage_from_fscache does mark the
page clean, but does not free the folio lock. This happens in
__cifs_readpage_from_fscache on success. Releasing the lock at that
point however is not appropriate as cifs_readahead also calls
cifs_readpage_from_fscache and *does* unconditionally release the lock
after its return. This change therefore effectively makes
cifs_readpage_worker work like cifs_readahead.

Signed-off-by: Russell Harmon <russ@har.mn>
---
 fs/smb/client/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index fc5acc95cd13..767bcdd95b31 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -4681,9 +4681,9 @@ static int cifs_readpage_worker(struct file *file, struct page *page,
 
 io_error:
 	kunmap(page);
-	unlock_page(page);
 
 read_complete:
+	unlock_page(page);
 	return rc;
 }
 
-- 
2.34.1


