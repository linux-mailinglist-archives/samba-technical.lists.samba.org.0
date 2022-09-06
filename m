Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7795AE298
	for <lists+samba-technical@lfdr.de>; Tue,  6 Sep 2022 10:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=u/J8Zhonr/uW33PDbEUAbb/pF7kkaueaGsMWAnXV1Nc=; b=Au87IND0j1q9fzOnkBIRikjOuL
	H/9OS3K0Rpmh0W9J1daWxsT+Ro5EEIo6L+KWLsnd26+ci4rbhVJ0uNN9621j37QtKkSqRF69kMfPA
	FkfPztPjC/NT+LjHH2UzsKhWGVe9ckLdP0s35g9LpnUsdZTCdAAdpeM6ItSXnrhfgFJX72hcjWny1
	Ikl3DEa41L1H5T5xGXgn54JTwdfwbJaQ2U6UBl7br1qjXLyA0v1nLgRZSnIRpyuEAQeQ6J+MlkRv/
	XyU7NC8Yw6tN9QFqi3RMQh/Lg9SZPro6KQLsDEcUaEufTxN8z/lxJKPEZHBAlUXpRxqxWKjZUu3dq
	2zCo5Y0A==;
Received: from ip6-localhost ([::1]:58564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oVTxj-005epg-EQ; Tue, 06 Sep 2022 08:29:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53306) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oVTxf-005epX-0I
 for samba-technical@lists.samba.org; Tue, 06 Sep 2022 08:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=u/J8Zhonr/uW33PDbEUAbb/pF7kkaueaGsMWAnXV1Nc=; b=JnqF38ITt5APwel6lHTipuQlUQ
 2F5ATrDnAnGAT1s6FPwuc41zlE+QmVXnPDFsfn75uAowMTjDJcFLpjfPk8L0BpnBPDJYdYZFeGyWv
 e3/dLTUEjPA3mbM0XrwCYI8IWcqgZEelESLUtZaCCqwkDqzu+UzlcdRHbIG3glxV5qknVWpogOTNV
 HVLbeNW+J+Gdq8GLVl1hTUGx5upJndUSbKpVMOuVGnZbPt7alaMf4xNNp0a5AGOSImsCAcuB1QeCl
 TEnyCoGj3AjeLR5l1mukwcZFfEoZ3OO3Es1eslvcCdtdoPFVK4ok80gd3YKqhVShJHGYAFml/FcG1
 Mn23nDoMQyesQw9lK6iT48oU2UzXAkQR+TZmmNWwFcrWbo1PFN4dLIg/+jHtO3AGaCF8apsvtjTT5
 t3hksSy2WryFcCGXF4AmnwwWesVICrZ+ykDO+HSpSYmqVPJ5m4sQF1y7bieUHItgixVdz2iVUcKRJ
 GVitfWwLEbSCRS8Yq0itPFO2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oVTxe-003KF2-GU
 for samba-technical@lists.samba.org; Tue, 06 Sep 2022 08:29:34 +0000
To: samba-technical@lists.samba.org
Subject: samba is sending service debug logs to ...?
Date: Tue, 06 Sep 2022 10:29:33 +0200
Message-ID: <5860045.lOV4Wx5bFT@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've just found out that I do not get any debug logs from services. If I set 
the kerberos debug class:

diff --git a/source4/kdc/kdc-service-mit.c b/source4/kdc/kdc-service-mit.c
index 31cfef2eae1..d8ed1e19986 100644
--- a/source4/kdc/kdc-service-mit.c
+++ b/source4/kdc/kdc-service-mit.c
@@ -41,6 +41,9 @@
 
 #include "source4/kdc/mit_kdc_irpc.h"
 
+#undef DBGC_CLASS
+#define DBGC_CLASS DBGC_KERBEROS
+
 /* PROTOTYPES */
 static void mitkdc_server_done(struct tevent_req *subreq);


and then start with:

  make testenv SERVER_LOG_LEVEL="1 kerberos:10"

I do not see a single log line from the kdc service! Where are those logs 
going to?


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



