Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B63203373
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 11:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8C4WxlIPsrBEktDbD2DNkdMuDRAD0P7qNa1olMmm2jM=; b=WVRXGx2iPku2LQepJixdXgHUdx
	aZAjGBuSMUOMlrzb3iGKda028DfXZ7YKEvn/+rhTecq5HGjQPlwJ+y4s4ei3lMSnbd9/0Yr0iXxDE
	WGVNw4oEyXr5h7JQUsiWWitXcpL2hlTtnoh2emVfwWxBKJGHHep3jIKB4mgAn3SwL4FAKHVzJUHQC
	F3Z7vmMBCJH2hgmzJ0WXNg2jpcMcIJ5V/HdJBxQKispfkZbf6HfSH953lQOueOpy9A4Sfwr8ZQefV
	ynNUD5kSRfaCHkIt9WB4AyoU9zx64Esc8oXucV7Nxef5hwC8U2OkEX+ZpdVgCruBKzd/93Hg3rZEr
	ggwx6xXA==;
Received: from localhost ([::1]:18782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnIpB-001k8q-78; Mon, 22 Jun 2020 09:33:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnIp5-001k8j-Pu
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 09:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=8C4WxlIPsrBEktDbD2DNkdMuDRAD0P7qNa1olMmm2jM=; b=cM7drDyyHJBJsGlA7xdL0y/XZ2
 1Dv0+6ZKvAofeqz37UhTQosq6Fp5+ntV835y5HGKB1+s2Z4Ajgaql8eoQf0ANobRvXnI4qu82ZM+b
 2JMstnTwL7ZPrPLu7ALtlhaBlVI/+znF/M35uor/Mcj+V3hgoQRot/o5FNu3OUosbz0J3gvjsKeF4
 J07+M7+txMbRpQjtqZpEVSRwyqWfbG2AB+I3LJS4K+E0/i1gEIxnJDIiNFD0semAplFla12p0Ay8i
 OSaHqB0Gv7lOffLLmoKbROlRonWKOhqBtZVVDBP2sFylaEgf9kLMF8HrO3iHLuObY8PHC8hHb3/aT
 wzs/iGLYAx9GXzfbq5gg6r0GK4DZLMGbOmZtCNH7tHWKZ8rWH8+byGV3oTSKa2MJPCkGz58dhzrYz
 TobmV6gpw2vtCbcM8UBAJ9BndvrUAX0L/Hupz2WlH+espNmpCMMYPKSjn0Hbvl5Tc9oPIEzJqNXL3
 AJt/jmlPYD+ooGYGVUjHoOF8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnIp5-0007B6-Dt
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 09:33:03 +0000
To: samba-technical@lists.samba.org
Subject: Bit rotting Gitlab Merge Requests
Date: Mon, 22 Jun 2020 11:33:02 +0200
Message-ID: <7182750.do8tPmMlVp@magrathea>
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

Hello,

please check if you have merge requests open which are bit rotting. Please 
either update or close them.

I would also suggest that we close MRs which don't get an update for 12 month! 
We currently have 13 of them.


Thanks.


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



