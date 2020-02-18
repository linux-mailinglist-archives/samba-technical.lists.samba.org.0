Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA9C162A0A
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 17:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZdkUnw+Tdx6IwQYMBeXolOG+RYoj2EDFmg/jf+sXAPk=; b=oekflrRMiWed2DYxjRYdBEroZY
	ZF2tmFO6da+eahRYTLBOK49vim7NHguL68/SQBkIcYB2kjmc/5M488z/7gdEtWkdw6oD+5eo3HvHW
	3iJNf1k0uWndAuo7K8FYBliSg2QPxO5fzO4tdZiUQ7gIaXYFVCAMiuInbMwjTdSgR+487cpUNICJv
	gU/RqeEmZY3iRUkYvyxu3dF7mGCk5x4nrhaxCkkrSywA3k6NGm1xoeOfR9/tpp3u9KuivTaMKQfIQ
	Q1ZCu0OnvNwBE3IeYdc1iexE6q8vbklg1DEAaAGjrc22lqxcXJ7rMYOKFOnwM/X6K4LPDEbOlJ35N
	JaAaaqfA==;
Received: from localhost ([::1]:60444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j45OI-00AOfP-68; Tue, 18 Feb 2020 16:06:30 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:37685) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j45OD-00AOfI-5D
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 16:06:27 +0000
Received: by mail-lj1-x22c.google.com with SMTP id q23so7511004ljm.4
 for <samba-technical@lists.samba.org>; Tue, 18 Feb 2020 08:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZdkUnw+Tdx6IwQYMBeXolOG+RYoj2EDFmg/jf+sXAPk=;
 b=YMkTPMWRFeoWqQsxFx56axUiKjMPmkLnhr0F1c1aeSBisv54wVn1dVZfCh/K98ns92
 /O7Q4V9KfBoqhgwFMWS2D4JD7jW2vhrhf+x1z624LWOAOzVmjo5gpnMPtriW2lWwb9Q+
 uke8HwIhDaOrih3UFp+OuD7z9PvsxeP1GzRQWLoHF3TdotykOOYd99btMXRtYXTJVwvS
 vVgjkgA8skeblEUCo6Pwq+JyQOpeVayEhuBOYANDJ6R3AIL8luJhuoe5NkfLbO1R1AKU
 7vCPzuSULclD8xFO+TykFikcANElHfRSpdhIOhZl52HZMRTOa2ocfeE1nBZzyhI3sBfX
 uXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZdkUnw+Tdx6IwQYMBeXolOG+RYoj2EDFmg/jf+sXAPk=;
 b=CXpMFZJ9sQzzJ1Fxv+0gb7Z7Dm6xsDTAY6kRlehmmjl32K+k+t1Aq/RJhddDWtuYJn
 T/yDb5eS+K/HVP/Y3YQiCPymiyVw15QdQuIiZzSLmPqf0vPXOfI1DsoDKHJaNyUgvjYW
 JwxJhoE5RUqsygD9fQ45wtOSEVxpUjO3PagC5pgTDOT/bY3EVQqUtjCnXWnCdKP9fcJ5
 Zh3R4VM70kqzMZt0aGL0zGgo0yjjaCona7q5KDTt9aYFA3oqBG6DOJr5bxyXNRtBeklL
 wWgnERhCj7/6xc1wwfwZZLkGLgUN9ENTKCFy5KwxXl+ZlTnb00pVgvj75bMbvoIcb5j3
 Lv7Q==
X-Gm-Message-State: APjAAAWUUKJia6zc0x2bonHSTOPPbk6SduBm6DGpRsFeP+q4SQHv2nyz
 xy2DBXvdwaqQsIIybK97WGaurAsiMeMI7vR0UPzFRBep
X-Google-Smtp-Source: APXvYqzahHbZfYuo+8ptfuchjgF0ncLkbUXZUmVGHOKQahLlKvLyviDG6e7iX9Bn12E1MCZWlIPqE7cnyE3Z/q8d7Ws=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr13784840ljc.158.1582041983617; 
 Tue, 18 Feb 2020 08:06:23 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 18 Feb 2020 17:06:12 +0100
Message-ID: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
Subject: ADV190023 | LDAP channel binding support
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, 
 Stefan Metzmacher <metze@samba.org>, Andrew Bartlett <abartlet@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I tested net-ads-search from a joined machine configured with "ldap
ssl ads = yes", and it works once I also set "client ldap sasl
wrapping = plain".
However it doesn't work when I configure the DC to require
channel-binding with LdapEnforceChannelBinding=2 as per ADV190023.

Has anyone looked into channel-binding or has any idea what is needed
to implement in samba (or upstream) for this to work?
Is there other ldap client code in samba that would also be impacted?

BTW, I noticed windows clients use both singing and sealing, should we
consider changing the defaults of "client ldap sasl wrapping" to seal?

Thanks!

