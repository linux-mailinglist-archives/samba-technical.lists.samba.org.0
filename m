Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD010A4F5
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 20:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=aPLwfb7kTavHN/hlwaNKLUM9dS+4uMEjr8dDgrBQpuU=; b=K64LJ/HStUUcaAVIOLpmpWct+7
	RwGVxiXn3LX0BgSK+jG00RP1KlZi9b19sgDEqvbAzBaoZGeHbfxWciBH+6M/O50iKGZhNS2FZugpr
	R1lOKvHGRcDsJZ8UHi424/a/NA9/PC1ENNSBrX2OzetC6DQBHZaqfVZqnIJQl+t59nlm/4NzUUYut
	mXHBCfSP9M6WPsJUuhoXaw0DiskU+Glpni62hIy/x9LTp349eqMXty6Ab+aD0CAemE1e6m0FGlBlE
	kAs0X5Ofei3lcGTVb6gFWRCRBLQcEJuRJ85ErpwAye3T97RYbp2f1FuZSh9swqfPBVpYepVyvfTHe
	OzEVUD9Q==;
Received: from localhost ([::1]:41282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZgyT-002XY7-IZ; Tue, 26 Nov 2019 19:58:13 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:33579) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZgyQ-002XY0-D2
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 19:58:12 +0000
Received: by mail-lf1-x135.google.com with SMTP id d6so15161704lfc.0
 for <samba-technical@lists.samba.org>; Tue, 26 Nov 2019 11:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Jo+iiWWwUEiqetDzt4sxlb4JaKvFZJNKt3hELmylECI=;
 b=qq8wTiLbQiEms2+o3Sqav8ZhPk1uuBCKiDSKM89AQX7XWuCLLPy9HGeW7ZPc4JePXV
 VOL0d7X42cUHZaliURx7fN6EzW+asdxaRQdbF3Q+vUSEkqhS7PZshPb0Rxz/q4r02pdm
 Zwt2WJLp7a5JWfjM8PBk9Bh/7vVDhVbwSoVFttoM++pS6orr55LG2XWCn0MaVlhn3ViD
 mmzBbBd3tQubvZwVX7V+Q3LTykHB24zauOSe8/Kc2Opy9wnRgUpeQPlZtrr8/Jwv/Krt
 JHqr+A7agalOt1C6UWGEQpLMXTsv7rm1YqmNvvloneo2nqt3rMNN4oWii1+ZE6B+GqTQ
 igYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Jo+iiWWwUEiqetDzt4sxlb4JaKvFZJNKt3hELmylECI=;
 b=qYuwqXr5nwZGLbYmKCYMH/yh1se1KTwTyRTv6Df3+cEiZyc7aTVy+perD90oarq5zQ
 gETXI3VO15cs0UroDoeYuoqs51/97WrKdO/WuQ+QkyJzIzkFUaueFUdQjMbXXwB/MrQY
 3fUTrI8aQVXI3nbo0i5RdQ2cm1b1LmS+qTg2r+C0cu2t7CMV1+Ns03iVAZPby+UBUVz7
 AHEeNZTzj+GNfQHegtUQLOKhsibfEOu8fCh9+SimDajxQ/PCQ+Q8NMWtWGEQSCNrBrDz
 sfVkzPgVMg6CT/PfLh0EWWy7N8uJNCOzH5Y+U+ySwvz876oYbZQJqzAAXjS76IK7arZv
 kUIg==
X-Gm-Message-State: APjAAAVDpe/hXL3UOVq1WhdSkXmYRK8YBihVKlI7C3IzHOgaozOPrSDP
 xHlQ6bCLgxwK3vSiXrVX88RKjNTr79sW35mWXsjJFv8dBpE=
X-Google-Smtp-Source: APXvYqwLMNP0qDySIcU6pludL4reONikSSDb+ps5oT7xMLE4dOMCsR3yqtDowG56uMDtnCm3Nizl+p6/adyk78I1R1U=
X-Received: by 2002:a19:c7c5:: with SMTP id x188mr245194lff.22.1574798288792; 
 Tue, 26 Nov 2019 11:58:08 -0800 (PST)
MIME-Version: 1.0
References: <CAPw4iV5nHkd8E=9PfbYepaStPRoqWJX+iZRVicgrRf2vcHK3uQ@mail.gmail.com>
 <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
In-Reply-To: <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
Date: Tue, 26 Nov 2019 14:57:57 -0500
Message-ID: <CAPw4iV7P2BwdHqSU7gUMFaLy59oLKZnB+mvfPKEfCJTUubAePQ@mail.gmail.com>
Subject: Re: Why is smbd looking for Kerberos principal cifs/host@DOMB when it
 is a member of DOMA?
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 26, 2019 at 2:55 PM Nathaniel W. Turner <
nathanielwyliet@gmail.com> wrote:

> ... and in that issue, the server is *not* a domain member, and is
> starting out with GENSEC mechanism spnego from the beginning, ...
>

I of course meant "GENSEC submechanism ntlmssp", not "GENSEC mechanism
spnego" there.
