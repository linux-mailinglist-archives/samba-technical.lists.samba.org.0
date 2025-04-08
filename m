Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC89A8184C
	for <lists+samba-technical@lfdr.de>; Wed,  9 Apr 2025 00:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RGGGrrn8dkMW8Ig/LN/TRCJZBhhvtDzsXxmdoNkJsX4=; b=VmW6E3cH4cN4N8wQu1+k6A1+4r
	XL84OcFeyBA8D0nomEjkLZQfaSAcU81qQ7UuYLVyYSiTcDMU0cYQ5AcgdFZ8fiyIEJfJx1bkRkZXM
	JR50uFYmxUKSDD0/H+0/K5Mu93eJa6qCrRFVpoTv0fFgYuS2lR3CuzVSKquOlEKOhpFEaqyzJnr/Y
	7vn1HASRH5sN3B+Eht7HvUVI4TtoUD6/egoyD7Dsf+dMpP7iuqC0MC12HS0C7ysHcY+boZerjrUdb
	6b32+1qyqTaTiEIRfJeNFe5qgR043Aw6x98nMc5JTd6cFPr7WriV1KJoUkynuIOAUTFnId0xJ5eTZ
	BM/Zj77Q==;
Received: from ip6-localhost ([::1]:44296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2H7Q-001xPi-DL; Tue, 08 Apr 2025 22:08:32 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:59819) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2H7L-001xPb-UK
 for samba-technical@lists.samba.org; Tue, 08 Apr 2025 22:08:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-30f30200b51so19672421fa.3
 for <samba-technical@lists.samba.org>; Tue, 08 Apr 2025 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744150094; x=1744754894; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RGGGrrn8dkMW8Ig/LN/TRCJZBhhvtDzsXxmdoNkJsX4=;
 b=J5zlRCVVrBJANr5TcZsVbCbkqUehdEeyzg/IOXExNmfJWL98/imab33r5EvkT1uRbr
 EINtjPe9yivXHSUbdPM6qq4D8MTWFpCgssOZc9KQ2iO89G5zcESYgD6ONGtv7je2mEUX
 6BFbQH9QGvpEVj7vsA7N/AP91+Ekw0x1JYjZGqH7fSyYkiwLhCpcg28zk1/oWIr9v2/e
 0CvNr576OrUX/ZomFeNsPWFJ3xI3c2oOiBA0AXyNqkDmib+USz0C73N+Hrv5wf1b2+Jw
 OLJX18QUju6YyQoYBnfCGmkUTnUz3uiqJnF/zEQeluKp6H+x+vZO1bWV0gn08Om4Sf5t
 U/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744150094; x=1744754894;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RGGGrrn8dkMW8Ig/LN/TRCJZBhhvtDzsXxmdoNkJsX4=;
 b=o1mnH+TicbRBODoatViPFAfwILjRSaarxbEQG+wSu9HwtSNy4a9w3rzSDbyKY7XheQ
 ZMhQWMEPYwNVml29OBMIFeF4of9VokdtDinThGGBX7QEQCBcAwsVWpwCW3+eyhd/oArp
 HCdB9floQ3MJ/gm6CShYbxFWLprRp5ARxWJdxT+aBVPCi9+YPCLXOsYSriJsVXuaVC3N
 gQw1xQDS20jPfRp24OKdrMrepcfpkQ7yPMsyFkIvuKTN+fF5bT/jRGAnhqoAQnPh/DmP
 BRyZYu23Mh4gGaxxt9n74ooQS+0tI3dr8dM5LcKvzJamBKMUltaIY6NwHmN09gPRqRG+
 FN8Q==
X-Gm-Message-State: AOJu0Yz40hTCQTVnEotH8yk42YN9+5T0NNIWGO5Z9fAruVkjzke/TQWk
 H92ik7ddms/6q/ccZX7Te4CPcqDUF1w+KSOhfWQISkAps8J6qoaT8+85Ipd8xNYspGaAugQTRYM
 qJRD8SosEaCnsZsQ2axxF3XWkn5U=
X-Gm-Gg: ASbGncsJ/z47Qxc4bAIacDFWy75KuiMvij8xSwEotqdzq0Adw4YhLcru50rwXKrWBuD
 38CT19Ai7FwCtfNMwA/1bQ0l67h2rKqoO32UEiovDuowiQq1ayYSPjHH/gT9aCSAA3C6EX8LWN7
 5mz2686OTLJGE24TGZ+0KGqpE1U+IqtsgPeTzM8O83472G86d8eya2alf+KNx9
X-Google-Smtp-Source: AGHT+IHu8l7CaCpd5GAL8kGUXhKhWVdfUzypYrBa0WwrOr5FX0Uy9xH1gMkQ7cH1VzLDDlY+Za2wgq7zJ4/8gYsdtvs=
X-Received: by 2002:a2e:ad07:0:b0:30d:b328:8394 with SMTP id
 38308e7fff4ca-30f437e7456mr1704991fa.13.1744150094228; Tue, 08 Apr 2025
 15:08:14 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 8 Apr 2025 17:08:02 -0500
X-Gm-Features: ATxdqUF1Nr0rQIHpQKAkGqI_Gwi0EX5Kt_SUVKjDg3nTWwz8gTY8ztm1PrqnuUE
Message-ID: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>
Subject: directory lease handling perf bug
To: CIFS <linux-cifs@vger.kernel.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Enzo Matsumiya <ematsumiya@suse.de>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In doing some additional testing of directory leases to Samba, I
noticed that to various servers (not just Samba) we are not caching
directory contents (e.g. a pattern like "ls /mnt ; ls /mnt") even
though we are getting the directory lease.   Digging deeper into this,
I noticed a performance bug -
e.g. look at this function in readdir.c: called from cifs_readdir() for "ls"

static void finished_cached_dirents_count(struct cached_dirents *cde,
                                        struct dir_context *ctx)
{
        if (cde->ctx != ctx)
                return;
        if (cde->is_valid || cde->is_failed)
                return;
        if (ctx->pos != cde->pos)
                return;

        cde->is_valid = 1;
}

The dir_context passed into cifs_readdir() never seems to match the
cached dir_ctxt pointer so we won't set cde->is_valid. On each call to
cifs_readdir (for the same directory) it looks like ctx is different.
 This doesn't break any tests but it seems like a huge hit for
performance that we are incorrectly checking whether to cache the
directory.   I couldn't find a recent change that broke this, but it
looks like it will be a HUGE help to perf when we fix this.

--
Thanks,

Steve

