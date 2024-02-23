Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CFA86139F
	for <lists+samba-technical@lfdr.de>; Fri, 23 Feb 2024 15:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DQ/LzJJfBJCKVDK6q7WrGii3p2efzatgCGr1R/lL0Io=; b=3wI0Z/PU7WH2I+iEyckPoF+EWV
	5a+O25rJkfKpoYEW18qiYYwYqBvZnyXP3ZaYPK83pn7s/2KUTwbHUs/TqtdtHEA//oLMwcL9mbHLN
	f72q0THNZs68/0hsw7DpyGhiiMcUvGXtXXhg49p/w8jftK3NUfCp7Hk22bM2u+g+x/xZAGEqi3vxe
	5mEr+IlElKx4x3C3eC+ZKhqAH/xPB49bgsmwsF7w04mkb8uPplwv2OKu0xH19uChx2rvO2N49bAy6
	E42Ye0P37QWEEdelQLvX6UglJ0kkUZrIXcPfhN+N/nfAeCGRXDWSsfhwngvbdJOqA4OlAtVuXnM8m
	AaXz7FMQ==;
Received: from ip6-localhost ([::1]:24776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rdWEJ-009HF9-4i; Fri, 23 Feb 2024 14:08:47 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:53802) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rdWED-009HF2-Qu
 for samba-technical@lists.samba.org; Fri, 23 Feb 2024 14:08:44 +0000
Message-ID: <e215357d673befaf1a2198aeb26b595b@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1708697311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DQ/LzJJfBJCKVDK6q7WrGii3p2efzatgCGr1R/lL0Io=;
 b=ULbon3CxdOjjIkuaOJgE/wlyfRO/FPejJfsfYuaiDCwB0acHg9dmddFtb8GRmDsEtscHaI
 fac2Wi09sOuuuCn5RhAVCtb1PZ2pho5LD8ipFLVnSmnTh4IY0TLEo+BFcrOlVU7hKk2UrO
 xgCGte4B74G/MjOhyP+U6TMMOrHLC11fjuJrMIUFelI1MG2kaf9nbEGJVUGt4QYGVnbGQ5
 kJX+GHm4ZEquijTj1F4TQwu3qf4dzLs8QBT3ai6es7GUlUE8sWyG7Ju/GuOF9SRt/tmwbJ
 RGKLcAMHRLedGE4QmXcQavh+PTulFW/2UPgwhoDACn6QHFlTcA2GLyTo6fWcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1708697311;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQ/LzJJfBJCKVDK6q7WrGii3p2efzatgCGr1R/lL0Io=;
 b=Z+EFF2NYL7AZP2/DCjUT9N27XaCQt1Ei72rOhncPFW6uXIJ863dJBunMRyRwIwmF+KZQm7
 Y3KTOA1bued54MjEgUqmwCFN2D9xfiyE9F8Ji7doWIrADUkEWdI0dReR3F1wz4a9MqBi0V
 jR1K/CESjUcEbbzKU5csMvhvBoQ9ZGUvPU4Q6fBB5fcfghbbTfD8XuKp53MHExaLV6r7XT
 5Ui39Rj3TVQe8xmQkjsu+8PLLnF6wEzjVI/xnwMfPmY9hT0DYzo1s7fy0DmLlrmdDSM84B
 ueeW3i+4CMWiX46vXUwssrs80WlhYQYurvFRIa2ye8HAV8aPJfYyLxZpz6G8xg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1708697311; a=rsa-sha256; cv=none;
 b=Yk8Y86VPl8FMJacYJytZ9HWQDgoxbfejODI11gHuXgjrreH4Jv7uBy+uTQFfqPGTsgYKza
 wyrk7kTglrDYT2t2hLqAAoAng8q1XHrx5aDxF8MG/TiEiFPLEj51hGeLULxo8g/i8043ji
 4gqKNdGUt+rAhfKrl2vhfciqcKYUkWBc/Xuh7iVz1OxWGXiF2gacNKsjeGRzKt3iueVthS
 rg3qjkpBm4q/bcPXU5Ho6nzaWP/YrOLrcv1Ppa3sWZsZokvfuGK/DvnA+nBRejhGD/5sSo
 nS6H1ARrTcmdwGdeUVNIbxkw6ofnEVKx2NP8MSnoCRpiJNgkuSQ0OeYzt+OkMQ==
To: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <smfrench@gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
In-Reply-To: <CANT5p=qTe2XQJYVdYiVkc34WdsE4ekHaH0f4uMwUoDtSNchwug@mail.gmail.com>
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
 <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
 <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
 <CAH2r5mtSB0nDKxAJHtnp6USgoeVN7hNF79NaOcX_pnF5MVPFhA@mail.gmail.com>
 <CANT5p=qTe2XQJYVdYiVkc34WdsE4ekHaH0f4uMwUoDtSNchwug@mail.gmail.com>
Date: Fri, 23 Feb 2024 11:08:27 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>, Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:

> No major objections for this patch. While it may not cover all cases
> like DFS, multiuser etc., it's still a starting point to allowing
> users to change password on existing mounts without unmounting.

As long as it doesn't go through -stable and is accompanied with at
least a new option like 'forcenewcreds', should be fine.  Then you have
the next merge window to handle the missing cases and fix any problems.

