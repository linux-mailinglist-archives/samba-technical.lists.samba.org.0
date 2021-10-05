Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F532422812
	for <lists+samba-technical@lfdr.de>; Tue,  5 Oct 2021 15:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=5KGhvPRYL7SX/NqfluRGNhQqnP9IzU/+sKlg6vwtHJY=; b=6DGc6e1FuGMbMbnajgr/PVtSUW
	noqlApgcBCKBRzrJWnfVxlxLBlXbCbIL4R4viIVd8/sCEP/oJqHxmgqSDqK4UeI/Pj6PgSl1RnLPi
	KhRjxC9SHSz11VvgY4XhEbdopayA2XnLin1tK0ZYu+UsN4G7hg11pXcHuFgss474221x2e1WmwHH5
	zIbmP3uDNY4MsyvRXfhBOced6RnBhiMimIvrOm/pYgNOYy1Y1SUuC08ZgO6VG0NWfVUsSqBF2MXW5
	nwWbJvwvhkSEl49dWCKh+A5YexAzqKUghu7dYcafl+VeCkVlWrK/WKIe70wSPNAdiD/ZVl/mFqVfB
	SyW6V0VA==;
Received: from ip6-localhost ([::1]:37956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mXkdR-004AB2-VS; Tue, 05 Oct 2021 13:37:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64202) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mXkdL-004A8T-2S
 for samba-technical@lists.samba.org; Tue, 05 Oct 2021 13:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=5KGhvPRYL7SX/NqfluRGNhQqnP9IzU/+sKlg6vwtHJY=; b=vdQ4Adf5SC4+YLlAduPdoGhq0/
 h9o2QsQDN2yW4mNThUJUHR4Qo/Y3jb8Rj8UX+ud27BwjtZS8U5l9fMK1Ijf4YVG9wn1wYBtrZthvZ
 jfGg3ro+TRyl6+PBNq2txkaD4YzTxD4lKPsMwT4YeF6uvw1GDirgwff630draKA1KlZMqIhR1w6lW
 u7f5SxMiMGRjIh01UsP3OIPFZSqaeya1gVKkKYrrUfOxsE7vi28CRPYTMl8AZF6EUjLUMjzoZRVUs
 gWS1SFv8HbNk9FLULWksoYleJId9kk1m5J0rmmrrOTMUmsTXEJlZWDCB28yxbBEcqCTauwvYEHj2R
 wSNK8dVRj60bj3s7RfAEBMF7YDSeZC3DG9N0snnz9lkS/WrJgHxpvHUdNNaFBdkR96OJVmtoj59Kt
 HvRY70WfSl2Ef7GLXMtT87d+1ujxAG0orfnic4dgLyNuGnFcdAff8n4d3HZH0DSD/7TbNnz177qss
 jPzH1IWtrwO4g4DcwFSxj/kB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mXkdK-001eBm-Mk
 for samba-technical@lists.samba.org; Tue, 05 Oct 2021 13:37:26 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Samba 4.14.9
Message-ID: <ef6a7da4-3565-7800-25d4-bfbb3a75410c@samba.org>
Date: Tue, 5 Oct 2021 15:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.14.9 is scheduled for Tuesday, December 7 2021.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


