Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4D6E3C9C
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 00:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=r7L6iVfHGSEuHJnJlOSQlO0z0Y0P9E7gOSyqlRN5C+k=; b=XNe1VlhJABfMlV2gKejuK88coh
	iJgyDoNHNvZYrabvY/ucxRqx8bm/8ZrbyfjiPgcqxmB+vpK9k1yyYbMcnDuDsVmPplw4gWMolhF8I
	YRchlWYBme/kwphWlz4tZEiV7SnyJWI3b4YvPm0YuqFYLVI2ufRXtgoue03wwTxXWfDxcvtiS9tIL
	4YesvlVKsO7OlRxA78U4W6Kz+lSHsVKVSxkzBdn7RmGUxxXxndXSwywmm/jHURG7eV2RLIQ2YzFI7
	C3LesZsATrMDSzeclVQ3rVGNdWnwwom2yd2A/dTzrJzYAVa24qMZXfbkzDvfWPEh3UQX/2y6Bl8LR
	I6F978cw==;
Received: from ip6-localhost ([::1]:51288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poAh9-002CGu-TA; Sun, 16 Apr 2023 22:18:03 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:56424) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poAh2-002CGl-Rw
 for samba-technical@lists.samba.org; Sun, 16 Apr 2023 22:18:00 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id AEFD880CCB; 
 Mon, 17 Apr 2023 10:17:46 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1681683467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7L6iVfHGSEuHJnJlOSQlO0z0Y0P9E7gOSyqlRN5C+k=;
 b=mTzmmIXolIA9PoaD47RyLEcnS9cGjkbCxnpQMg8ZzdxrBRMjzkKJTpsKc1TsaZb1JUvD+w
 HGIiKVnIsUj/f9KmlxoE5Fr/abQ1NXRy/sj+ZVuw8wO1suhYVFy7AQnIbcpCyeVLgB7r9+
 7sK3HJeMNr+wbhEV0YOJ4HrUlDIflf3m0zBeORH4e/7d8qfxG3G2TX70q5Kczi2RI1uexz
 As9ZoTATmDP1nCX87uTofw3I0iuyvjAOANatmlHueyk3iveG5fH3pZ+G1IPgmVDrd8opZc
 2/RTEckS6jFD94WBN8/nBLci1mJ36OxRv+mPPTywiTeyKJaLTRzxxY8serHLeA==
Message-ID: <3ed3e207-611c-e4c7-ffd4-9fa3e7468e29@catalyst.net.nz>
Date: Mon, 17 Apr 2023 10:17:44 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: The strange issues happening with ad_dc_ntvfs environment
Content-Language: en-NZ
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2142927.irdbgypaU6@magrathea>
 <8c78e366-5b95-f407-3ca2-2dc561b1d2f2@catalyst.net.nz>
 <13246326.uLZWGnKmhe@magrathea>
 <4cd5f631-f135-858c-5d9b-5913babef316@catalyst.net.nz>
In-Reply-To: <4cd5f631-f135-858c-5d9b-5913babef316@catalyst.net.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/04/23 22:42, Douglas Bagnall via samba-technical wrote:

> 
> I'm running it again to see what changes.

For the record, I left make test on master running in a loop, and this is what i 
saw:

      20 uxsuccess: samba4.libsmbclient.opendir.NT1.opendir(nt4_dc_smb1_done)
      20 failure: samba4.ntvfs.cifs.ntlm.base.unlink.unlink(rpc_proxy) [
      20 failure: samba3.smbtorture_s3.plain.XCOPY.smbtorture(fileserver_smb1) [
      20 failure: samba3.smbtorture_s3.plain.LOCK13.smbtorture(fileserver_smb1) [
      20 failure: samba3.smbtorture_s3.plain.LOCK10.smbtorture(fileserver_smb1) [
      20 failure: 
samba3.smbtorture_s3.plain.DIR-CREATETIME.smbtorture(fileserver_smb1) [
      20 failure: samba3.smbtorture_s3.plain.CLEANUP4.smbtorture(fileserver_smb1) [
      20 failure: samba3.smbtorture_s3.plain.CLEANUP2.smbtorture(fileserver_smb1) [
      20 failure: samba3.smbtorture_s3.plain.CHAIN3.smbtorture(fileserver_smb1) [
      20 failure: samba3.blackbox.smbstatus.test_json_profile(fileserver:local) [
      20 failure: samba3.blackbox.smbclient_netbios_aliases [foo].smbclient 
(krb5)(ad_member:local) [
      20 failure: 
samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//fipsdc/tmp](ad_dc_fips) 
[
      20 failure: 
samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//FIPSADMEMBER/tmp](ad_member_fips) 
[
      15 failure: samba4.nbt.dgram.ntlogon(ad_dc_ntvfs) [
       6 failure: samba4.nbt.dgram.netlogon2(ad_dc_ntvfs) [

That's 12 always failing, 1 always unexpectedly succeeding, and 2 flapping.

I haven't tried with the release tarball.

Douglas


