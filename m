Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F818E551
	for <lists+samba-technical@lfdr.de>; Sat, 21 Mar 2020 23:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PM+/QGCjQ3ThAVNlGg2OZpJuO+zWUXsukPZoPaOzjE4=; b=NSM4LEtmYXIev5il8ZaF+40U2o
	x4gnF32GvDrlmYIBrTa/53wDbcuFxiGJ226RB1/y9QTnSLds4VjQF6vxDjI560KWU4k6ZInIOrO0b
	BddQIdRILcO8ArV4sVS4zKsytCvQA0Fog45iQ8BoO4vjhsjoXHZvAmOBIBpdwWApSdh7NrTNHgrV/
	I7QOs7AAVaFz9jtyXLhfYn5RC3pXMRCBA4EYH9jWk6t2i8Y2aCAwPi/phrVkpxdjfJhyI6AeR1A4U
	RzdHIRyL6LBn0x0sdazKSD29vKBuC/b+btZSswlM6jcI6LkI9OEreqWQoid/eeTCuIu/krMMssKcD
	p0ZmhTYg==;
Received: from localhost ([::1]:35104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFmww-000OYj-3o; Sat, 21 Mar 2020 22:50:38 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41167) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFmwr-000OYc-7i
 for samba-technical@lists.samba.org; Sat, 21 Mar 2020 22:50:35 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id d5so4761834ybs.8
 for <samba-technical@lists.samba.org>; Sat, 21 Mar 2020 15:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Y53AUEo9bZKJnjtXkQB+mcrwVymlzuxy8y14/JhruvQ=;
 b=i3iJNWeFi41MplQx7tvZRlriaXyMGY/JYvYNtds1uNMlbHonlmqcJ+bwfyX12eeQi3
 EuXaaaeIV07m6ifwZXIC2BFCJCp0I8Jy65Sgt8smMVfWgepyl8y5R+QV19zaGa054wVN
 DkYdR8+zVNTV0fCuLxTY2zx5v715LMe4GhjdAYGl3dXcTu0bNdHhtw0+mKSVCb9QLl0M
 QCiYcJCqsc5nxOXGlTHac96ZmOMP/oHSkK8tPXCvf99CElPc7Dc4o/uxg57rhL95xKlz
 oV1DTJ3KEXiN48kEpNREmR+mqED8ZJe6ngpMg4JgQ1bQ/5Xj81wiiDpjm8JET1aZe14R
 +lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y53AUEo9bZKJnjtXkQB+mcrwVymlzuxy8y14/JhruvQ=;
 b=lhFXMOzEzhtACenwLR3vRbNtjSF+gD1LBFap7DjUxXSZZSFRDitjTSYfFW7slIzYQe
 Sp9qoVIvQHZQSTLVbZ2/j1Pp/stjrVYnbp+RxpfNhQoPLw/JsUtoOaVrlpLVkCEUv3aJ
 A4HsY6UTt15r9qZFfbahjBxsk8D1pePHgWT/VJzjosxOZ5YoupPc1TqA7iTd+7jEsPre
 uhT0mEXDL+TgnrO/QKm71pigF8Ax6j/gaToB+jSvVJfSf+0PMtnwIpS9Xjz4Pwafem0I
 3o/JFXc3B5t1jr/QIcup0IqWo4Ie3IhDfajEYKDwK8qAeKkzHRAhfihZITAaIO2SaMsA
 Awlg==
X-Gm-Message-State: ANhLgQ3GOsOFK347C6WDy2PgA+wgRaIu8xhYRYp+cjejfogcXKYRXWrN
 1EUZoZ4wvKLG8HvNcePv0spBDqNwzzL5DJU4viWxk/xE
X-Google-Smtp-Source: ADFU+vszXkg8fmPYHZp9dN2d3iuuEZk0W8dsgDp3FQnNLI+u6EV6reBeTpBh1Az/9yyfFGX24rMEdRcB6BNpCc/zAUo=
X-Received: by 2002:a25:3187:: with SMTP id
 x129mr23985595ybx.397.1584831028478; 
 Sat, 21 Mar 2020 15:50:28 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 22 Mar 2020 04:20:16 +0530
Message-ID: <CAKJM6MkeM-qmg71j0cykaRexFC6f4q8XTL9se_Fi8BKfFb4VCQ@mail.gmail.com>
Subject: GSoC 2020 introduction and query
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
From: Rohit Dandamudi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rohit Dandamudi <rohitdandamudi.1100@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello all,

I am currently doing my undergrad in Computer science and Engineering at
CBIT Hyderabad, India.

I am interested to work on the project idea "Samba binary size reduction"
as part of GSoC 2020. I have prior knowledge of C and Python as well as
contributed to open source organizations like FOSSASIA, Macports before.
Hopefully I am not too late, kindly let me know where to get started, and
what should be done to make a strong proposel.

Regards,
Rohit Dandamudi
