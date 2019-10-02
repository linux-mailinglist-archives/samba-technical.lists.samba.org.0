Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48877C8FB9
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 19:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5+4atlM7MHURP8FCjRB30fFgl4rofaE4wjWcMXD3e7M=; b=J3ReWt91PYQrpHm7q945mfIS0v
	IHjOMxwx907d2NJeaWKwhvTwp61Ja0ZhywbTiXm6KdybifiBK9+LEAbjZo1PdIrEdOZVh+8aB2bkH
	+6Vn3pWA6SYYV/mIxUuvDNC9LBBwRcJYKo3nQKpBR4gGQTXVWYMJ1AIA8zs6uaG1+aJqLjyJk1o9V
	PQ3aESq3jtEVCy3eJAEBIuiqMz0Q7mQKPUUgCd+oKAuA5SzldL1cEBJwvHXg9KmYF1WN19oYLnklc
	mrVw4MLOUndp1TG1bCO2tX8dRX6eING9AmIRCb0SzCCNwW6oN8+U1Ibic+mknDlOy+6pdhRiZ5gRY
	4YZr3gEw==;
Received: from localhost ([::1]:34374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFiIb-000VuQ-4G; Wed, 02 Oct 2019 17:20:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFiIV-000VuJ-TK
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 17:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=5+4atlM7MHURP8FCjRB30fFgl4rofaE4wjWcMXD3e7M=; b=atGWvYDvmVsRw9cKSj52sD3yPp
 gm+TNz4JV0nLf5TSmph4pup/SFdfUOtX7/pvwwf4xQwAuYTRD+tcFJ7lz+7POduCN6oWcv4Cad05N
 Zv+MFS+qDrEK5WvadpclPwm+WF1pRD/eLr4BqbWOIuCLrD9NCOcJyJRXfBO0T5hjTBY8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFiIU-0007mh-3A; Wed, 02 Oct 2019 17:20:18 +0000
Date: Wed, 2 Oct 2019 20:20:15 +0300
To: Andrew Bartlett <abartlet@samba.org>, iboukris@gmail.com
Subject: Re: The road to removing Samba's internal copy of AES (and perhaps
 DES?)
Message-ID: <20191002172015.GJ5765@onega.vda.li>
References: <1567389837.19432.26.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567389837.19432.26.camel@samba.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 02 syys 2019, Andrew Bartlett via samba-technical wrote:
> G'Day,
> 
> I wanted to write to update the list on where we at at with removing
> cryptographic code from Samba.
> 
> We now absolutely rely on GnuTLS 3.4.7 or later, which has allowed use
> to delete a great deal of such duplicate code.
> 
> We do still have AES code, for the AES CFB8 and CMAC functions.
> 
> These could probably be open-coded against raw AES routines from
> GnuTLS, but for now I would rather not go down that route. 
> 
> The operating systems that do not supply that[1], in our CI system are:
>  - CentOS7
>  - Ubuntu 16.04
>  - Ubuntu 18.04
>  - Debian 9
> 
> By April 2020 we should have a new Ubuntu LTS, Debian 10 is already out
> and CentOS8 will be available.  (And we already backport GnuTLS for
> CentOS7 regardless). 
> 
> So I would propose we remove the fallback internal code after Ubuntu
> 20.04 is released, or discuss it earlier if we can get a newer backport
> package for the above.  
> 
> On a related note, I plan to experiment with implementing our DES code
> via GnuTLS using the CBC-DES cipher and an all-zero IV.  That may let
> us remove that code as well, becoming essentially crypto-free and
> therefore honouring FIPS mode correctly in all cases.  Do let me know
> if you happen to experiment in this area so I don't double-up!
If I understood correctly, you are talking about these codepaths:

$ git grep -i SMBEnCrypt\(
libcli/auth/proto.h:bool SMBencrypt(const char *passwd, const uint8_t *c8, uint8_t p24[24]);
libcli/auth/smbencrypt.c:bool SMBencrypt(const char *passwd, const uint8_t *c8, uint8_t p24[24])
nsswitch/wbinfo.c:                      ok = SMBencrypt(pass,
source3/auth/auth_util.c:               SMBencrypt( (const char *)plaintext_password.data,
source3/libsmb/cliconnect.c:            SMBencrypt(pass, smb1cli_conn_server_challenge(cli->conn), p24);
source3/rpc_client/cli_netlogon.c:              SMBencrypt(password, chal, local_lm_response);
source3/utils/ntlm_auth_diagnostics.c:  SMBencrypt(opt_password,chall.data,lm_response.data);
source4/libcli/cliconnect.c:            SMBencrypt(password, cli->transport->negotiate.secblob.data, tcon.tconx.in.password.data);
source4/torture/auth/smbencrypt.c:struct torture_suite *torture_smbencrypt(TALLOC_CTX *mem_ctx)
source4/torture/rpc/samlogon.c: lm_good = SMBencrypt(samlogon_state->password, samlogon_state->chall.data, lm_response.data);

But there are other parts where DES is used via libkrb5. They affect
Samba AD deployment, domain join, tests, etc as MIT Kerberos 1.17
removed DES support.

Isaac has created WIP branch
https://gitlab.com/samba-team/devel/samba/commits/iboukris_no_des_mit_118
which passes autobuilds.

I also made COPR repository with DES and S4U fixes to address the
following Fedora bugs:

 - https://bugzilla.redhat.com/show_bug.cgi?id=1757071
 - https://bugzilla.redhat.com/show_bug.cgi?id=1748860

The combined build is available in
https://copr.fedorainfracloud.org/coprs/abbra/samba-nodes-test/ and can
be installed on Fedora 31 for tests after enabling the COPR repo: 

$ dnf copr enable abbra/samba-nodes-test

-- 
/ Alexander Bokovoy

