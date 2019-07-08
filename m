Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8161C90
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 11:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HpxALGqWR793ly+58BPvVCdieLlu+V4GwNDJEcOS2+w=; b=ilBq6dowcPxhRVsEiJJPHTK5Hj
	WuvygfcjAEA/M0/BmysOwEY9k0LA8sCfwCSLhv90RZ+L1iCzJSe2BoFkLaVbDoC8axs9Il3gWwSaz
	fB7eQ4+XzDMvAf9Cnia7SfRMXG7HO6QYTnN2623B/4h/uLKLHH33QWfbMUxJFT4HOq9b8i/1S0/ml
	EJF+XXNsOLoqtZ55HGYk57UW45/ERols31uhg7U4M4JSPpKar4dX0G+Ms5GmR+LsPzoVcbZHNHZV9
	nf2T6fIB1A+gv04ep9/rtMTh2UchnNM2AdedQ0sSffp0/dLQCLj2ogym3pPkqEbJa0EO3+e3oz0al
	srmarbtQ==;
Received: from localhost ([::1]:47020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkQFx-005pN5-Tm; Mon, 08 Jul 2019 09:48:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36909) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkQFt-005pMy-WE
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 09:48:19 +0000
Received: by mail-lf1-x131.google.com with SMTP id c9so8711316lfh.4
 for <samba-technical@lists.samba.org>; Mon, 08 Jul 2019 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=C4khY0Q271TUn74+LIJGlT7DQXsPnhSiJ+fg9nKQe28=;
 b=K4U3Z5nTkib5tyGoMsThH2E1Lr+wZkNjHwrHYoe/JdU6GCKHfMH21r7UidI4UukIa/
 OpN2x1xx/JK+b65Fi6HSGT6FLdEZfWfrUPU1CQ8Y58B5SN9VMR8dsilQ8GHYKTd4E1Th
 gjfiELCHN9c0s0De2BlrKA421FU4IXsMIUEnB6iGYVCMA1pqWMxhSk/iLUouBV0C/wOA
 ca5prX7YZwKeD+ititJli47dtbLA8modX78M4dVOGcDYGhxdSIvS6suVc2mCuWcYagJ7
 sTdWUQkSuIfdVm6YrbKJPfvpyR8hU7LFdoM+tQX7CZynXx2nqnYT8zQLXW75V5knktks
 91CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C4khY0Q271TUn74+LIJGlT7DQXsPnhSiJ+fg9nKQe28=;
 b=jRQMJJNsRnlUmnBt4eZHCcqiO3zLgZz/pVL0gyuncJZV/6UkpVNbv6g7qoV2X/HIci
 qm+D7YV9e4argxgV2kzTxnKi5wh+Qc/9uyPMilRKZlOl+spEafp2pdIkiwoHh5dzXul+
 +7RtQzu+tDajfHh/+6/HGCF9IGo5VyZl459AV95FEpWHemMSzEeblPORm1Fydnt2HnJR
 0RT1IHzAUmi7NhK7cAddeYvioeYnK0lSAt+WIO9oXstH3LD12Joht0a4CwXDuMr/v+EB
 XIYzHNp1jzKuiBVtg5hNzS5wPTXUa9KgBXene0sDEFbKGhxYlkoNlL4cLpT5r1j0uFmz
 pPVQ==
X-Gm-Message-State: APjAAAV1mRhC7tn/e70aPGLZUFfwWv46BiBcJ+eJg19IjgkRaZrwrjNW
 M+coh5rPloIjI4GjaRPio08ZZzaV0czE3sUl4e2b5cQDItk=
X-Google-Smtp-Source: APXvYqze9W/ziSd5kVUFNvXAQzGPxWEjDXGeOg5cOAvsrV7cX/J7b5Ljf0e/xMfV/9NGqNytTIKqfI5Dfxyr5zKKCqY=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr8154550lfi.140.1562579293379; 
 Mon, 08 Jul 2019 02:48:13 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 Jul 2019 10:48:02 +0100
Message-ID: <CAELK94cyZDNs8R5CgqkboRMYtXs5vxruXpMc_xY9SLW8K2zWCQ@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp - Week 4
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, a summary of my activities for the last week :
- Designed a PDMLParser class for parsing the xml output of Tshark
- Started implementation
- Benchmarked two libraries for xml parsing lxml (third party) and
ElementTree (standard)
- Introduced python virtual environnement for dependencies management
(update Readme accordingly)
