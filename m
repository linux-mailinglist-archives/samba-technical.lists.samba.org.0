Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6048591197B
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2024 06:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xfW1VvqoS5GPayLwNi5+EPc1w1LY8co3NXY1dfD9BDE=; b=WFfEvb6sMxfpzPgcHUmoEJN8NL
	1XcH5kXS6xN88pe04fxF3wC0cuXa+0iSXjeR/FI7h0ZeJ38oZJYNHy2+JIToo4ZJwWsCbc6eHNsIK
	thQPi+gXOYCYSWX+6IexHwc839QTtHdxNNmD5+zvXPbipio3411Qdirknc54jeBfa2tHyqpmkVh+D
	o1ZmgspqNG53pAgf0JeTU0Q+VMLwrb6VxAquRS8r+uc9znNVym1W0kpDwPb9AghRlpj+5CpI8egeP
	QIT3eodmATj0X8K7piD3EYCJt79YlqRG5kwQ773+Z27nwcj+d3PmNHzZiTm2v+SgiEmP3rmjgDa6J
	nfJjyQbg==;
Received: from ip6-localhost ([::1]:64582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKVxR-00En7J-Bu; Fri, 21 Jun 2024 04:33:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43297) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKVxN-00En7C-8r
 for samba-technical@lists.samba.org; Fri, 21 Jun 2024 04:33:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3621ac606e1so1596967f8f.1
 for <samba-technical@lists.samba.org>; Thu, 20 Jun 2024 21:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egnyte.com; s=google; t=1718944380; x=1719549180; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cVRP31fEFbe+6sb1xWV+6w1HJc5v+Pqt3OYLDA2Gm40=;
 b=gkkqywvhPlWKME7YMJ9+C0KgqF+ele9OYTeC1QyLdglPizSA8wj+MVSKaj5UkD9KB4
 4zZnEA0WKcCg31OAphHa8OkBmdBKMl6fWxvqXU5vhqIkGQkvL4EQyeKrrL6wtoZG3WDI
 tSFGpEHjdd13hrBA4cmD5ZDVvOwDpNgc0Go7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718944380; x=1719549180;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cVRP31fEFbe+6sb1xWV+6w1HJc5v+Pqt3OYLDA2Gm40=;
 b=j1cXcgh0kR9OWuqu1HNqHqSTc+a1mGdJOIjq1puP4nDw4MqyvWm2285PMtAS/42WNY
 o4JR4zmIzVSeQV1xIXifGZz5wx2XtKZI01NLyXvoll01NR/B1pQDCFOHij0eSGFRDggR
 71gcytnJAUtNkHyUej/h9ISdwXnoCXYggfA96r/90ijNalMQW4R2RG3RkDf8H0CABul6
 Z17sJ/67o+fRSbVmF09hkLvxvJpxn7IrCo19jtF7+sri3Gy4Qfk/QOxgHfguzgwrrP8x
 GxIZXLsK3JdMC+ucTlVz8YVwshKSdQ/jVIKDp1ECQJWloNPrMTB5H+qcZUJ+EWC2L6AR
 UzhA==
X-Gm-Message-State: AOJu0Yx9u/68qxiMPCMSyuEz1H7oZ2dPxl176IKDOZznEc9GjkJLYBZN
 8Rr5qyQHl2tirsJ4vY6Zs4eMkcEm/lQNtXTp6El59NO6t4mOhr7RRNFqPmCbb3UWyumsklCp2lS
 3v8h31R6d57udZ7cVmSfHs4Hx376kTTByVAAZtYevS96ByaS0UvI=
X-Google-Smtp-Source: AGHT+IHfH+xngZvBT+OKvf/FA/7+V1mPV4eGkmQMh0roAqVU+VZ5HgBy4tkQti5iDl7U39/BC38VqwT2/BYlm98H2/g=
X-Received: by 2002:adf:ef89:0:b0:360:38a6:6bd8 with SMTP id
 ffacd0b85a97d-362ffb42f05mr5685205f8f.20.1718944379798; Thu, 20 Jun 2024
 21:32:59 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Jun 2024 10:02:48 +0530
Message-ID: <CAF2c6-HkQ9_6R4Q8MmBE+i_XcU_rmMdTfWmDvV4R3fNmyKRx1g@mail.gmail.com>
Subject: Understanding fstat call in streams_xattr
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
From: Varun Mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: Varun Mittal <vmittal@egnyte.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi
I am trying to configure the vfs_fruit and vfs_streams_xattr modules with
Samba version 4.18
However, the setxattr call keeps failing with an error in
streams_xattr_fstat function of the streams_xattr module.

Digging into the code, there is 1 snippet I could not understand

static int streams_xattr_fstat(vfs_handle_struct *handle, files_struct
*fsp, SMB_STRUCT_STAT *sbuf) { ... sbuf->st_ex_size =
get_xattr_size_fsp(fsp->base_fsp, io->xattr_name); if (sbuf->st_ex_size ==
-1) { SET_STAT_INVALID(*sbuf); return -1; } ... } static ssize_t
get_xattr_size_fsp(struct files_struct *fsp, const char *xattr_name) { ...
status = get_ea_value_fsp(talloc_tos(), fsp, xattr_name, &ea);
...
result = ea.value.length-1; ...
return result; }

Why is there -1 in the result ?
If I simply remove this -1, I was able to get setxattr to work
