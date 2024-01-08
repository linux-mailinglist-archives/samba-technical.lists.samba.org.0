Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B71827529
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jan 2024 17:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lFQMv9XwK9ej+tAG2vSPh6/ex1rfcZMiQqZcNXWZROs=; b=hj/UOOVQ9Io12+EX/m7FpRBDpd
	bh1CdGlvjFg2lXe0xtPrDm6A/XS2aVDIPJHIj+J//NfxpyxCy5Kq+zvV1uAN2EJVQ/WBy1C0pgTgr
	yrbzxqqkjiXlivkIKQgYb68eeheSCgDoyXdXnYcJaYWznwl8WEvTn3eK/GmKnpxaLZeCt0Tovk7lg
	7cKrwcus0PuWQFzyBeMhTcDZLPfoMp2gXkvMAmsrOu638FAJlEAwlAjM46CdpuFCdCI+lFqyqZZFI
	6twKiRaimfY2rxWRLuKIubMn3h8d6WE5KUzvqdy5/KqM3hSkxZO28rBISjMhpaLOLuDohMyHrWnJA
	fJNMOJcA==;
Received: from ip6-localhost ([::1]:43012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rMsVP-002o7b-Ls; Mon, 08 Jan 2024 16:29:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46648) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rMsVK-002o7M-9p
 for samba-technical@lists.samba.org; Mon, 08 Jan 2024 16:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704731370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=lFQMv9XwK9ej+tAG2vSPh6/ex1rfcZMiQqZcNXWZROs=;
 b=EOcmxlmhaoBzTtZcL7q4c+K1D40r1JBRwEEzApbBOZl5eFYhTg5J08/eUOn0MS9k7wmwTa
 HZX+iqeMgpCWzwnT8ETFLP6+V7/6JKIzhJLAKzuvw7OS/Kcp8U493N+qgL/RVRCD/Ro43B
 hlDi0AZnFLg7ZXj/uqwaGUuek3Xsi8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704731370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=lFQMv9XwK9ej+tAG2vSPh6/ex1rfcZMiQqZcNXWZROs=;
 b=EOcmxlmhaoBzTtZcL7q4c+K1D40r1JBRwEEzApbBOZl5eFYhTg5J08/eUOn0MS9k7wmwTa
 HZX+iqeMgpCWzwnT8ETFLP6+V7/6JKIzhJLAKzuvw7OS/Kcp8U493N+qgL/RVRCD/Ro43B
 hlDi0AZnFLg7ZXj/uqwaGUuek3Xsi8Y=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-JN-8selGMFqVoy8x3h7ASg-1; Mon, 08 Jan 2024 11:13:48 -0500
X-MC-Unique: JN-8selGMFqVoy8x3h7ASg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5e8996ead39so31887657b3.3
 for <samba-technical@lists.samba.org>; Mon, 08 Jan 2024 08:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704730428; x=1705335228;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lFQMv9XwK9ej+tAG2vSPh6/ex1rfcZMiQqZcNXWZROs=;
 b=v0mh4wCMGSpdImJxKb6wFm5RpXdK8R1mYTKYtQw+wnbWa8y5kK53JhWtj98Eo6OiGc
 Z2eluGOx5CQ3z/naeSpgXDYdZQkgLS1gqwkPob6cOOqGGUgFv67kSnTIRhGi/Cea94rR
 gdBLKw+YL1/jz+/uU/EMMCDQa+urg0v1A+svO9mauWxGfvHb7n5c8Hah/qPeuVdnl4tF
 7ZtWwKwlUpDgzdoNL3qfBf+aDurhqQVnFmhELI6UGC3RrHnVLOi8F6hCEsIMkE6/OCxG
 rcQyGQkcHrhI9GfAQsbwMXBl1X9u0Bqcr0e7iUpocKNwcAdi5kW1dGeJmujrY++LJLOk
 b8ew==
X-Gm-Message-State: AOJu0YyVP152Kjsw+FGPPn2JjElZsIgbLGRgjkvnh5guB/vVpLzjNKIl
 /0/mOsStmy2iQV8BR7zexXdh7432zLHdgEI+41d1FjMsnng7DsgYmF+KaZNp2MncHTB5L30LmAp
 u8TuQeTStnvN2Da4UFlrScCZPgYqYmPcDty/bICIliP+1X8VA/Hg+b+9Qb7Fw8tM=
X-Received: by 2002:a81:a0cb:0:b0:5f5:ca34:c1d with SMTP id
 x194-20020a81a0cb000000b005f5ca340c1dmr2469046ywg.49.1704730428145; 
 Mon, 08 Jan 2024 08:13:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeEMgaCZVBx0ixfeLvGAxJPO59TIbNQsubdgH3bNAFRgaSAlSLNFmVBSOZWkzfm0AOQ03fJlmlNmG4ZoHECNI=
X-Received: by 2002:a81:a0cb:0:b0:5f5:ca34:c1d with SMTP id
 x194-20020a81a0cb000000b005f5ca340c1dmr2469038ywg.49.1704730427923; Mon, 08
 Jan 2024 08:13:47 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 8 Jan 2024 11:13:11 -0500
Message-ID: <CALe0_77CgEXNiXrM4oQ47sfHnDoML18oz5rmEu-_57Av0KRTkg@mail.gmail.com>
Subject: Linux client SMB and DFS site awareness
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
From: Jacob Shivers via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jacob Shivers <jshivers@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have a use-case for a Linux SMB client to mount DFS replicated
shares, with a preference for sites that are closer geographically.
DNS site discovery/awareness exists within DFS[0], but I have not read
of any work currently under investigation.

Is anyone actively working on this issue in any capacity? If so, would
they like help in some capacity whether testing/coding?

If this issue is not being actively engaged is there a reason for
this, e.g. low priority, technical complexity/implementation issues,
or some other reason?


I had searched through mailing list archives and found no prior
mention, but I do apologize if this has been discussed and is a
broadly known discussion point.

Thanks for any feedback,

Jacob Shivers

[0] https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/7fcdce70-5205-44d6-9c3a-260e616a2f04?redirectedfrom=MSDN


