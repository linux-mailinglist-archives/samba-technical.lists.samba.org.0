Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E212172DB
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jul 2020 17:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Su2RIR4wh3PJ9TyjYoCsRlXXBWLS0DtOl7sJTm+sltA=; b=W66KbfA9c7D42SnmnIynCTpLci
	eJNPAvr29FK8SMjR7PLZ6YxXbB5hGTJiBdhrR7LjZOJZLNz7JLr//txbSfsWQnGgVrODAny/HHbW7
	bYvV7bqHXX1iOcYR8Isa75CNcIgN7D7mxVXPO+aEm99agaeAGjUREr1/H1zCYuCswx8jEdcYAEwYh
	rphyfGzH+amBH3de48iszQVrdIwTX66t8g7GmKfSrIsFS7qjv5ty4wH+arl1dNhhH9O7Dup+JSw/C
	8bkTa49t2vr8QrXvpaw01l/tdy/+7964aq6DdbaWg+sHOUw1ysrj8UwXWkCyx3h6LMutEyVXSPW+O
	nP6tyvVA==;
Received: from localhost ([::1]:24740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jspwV-005xGh-VM; Tue, 07 Jul 2020 15:55:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jspwO-005xGU-OG
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 15:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Su2RIR4wh3PJ9TyjYoCsRlXXBWLS0DtOl7sJTm+sltA=; b=sjf4JA8o8yT511A4mt07bQErN/
 Mksc3vzuAvjzj+dtaMhoM5MvCmpg5HZp/4deKbmt1swW0DiCrIo6ZhDuNNe4WCLDjhUktTrw+h38q
 QA6wjNsiBnLL3oJ1GWs0ccV7pNY3Q43YhU6HKzpJWIOX99jFTo944NpG/+aWPnqNkQ1L47AMT0eDy
 JK/p6nxZkpkGXNMYG0bH6OSRFOb16uq8wddG7zqDfvB7xJNbWuwMx3LhjA3FMEbZNQ3aLjODymETb
 zRX7BkEGqZzmU/mTWtEd2mTBoZz9Qs3S8yNN5a0eDLBk0RrZ/E3Fb3ghWbHRFkfN4g7KSRi5l0Ymv
 ojN1gZL618iCRX3zPdP1Arujq0lcPbZQ3LgBu1w0mnQ9AOJbGfxTiy0yHXheLotes0eCJ1JLo8gn/
 wIVL9xo7fZogq7JsbWDYgta7yb/5zvdxBzQ+woesXlpNTriH2ECh2OLzBTdmC0gt+x6ezn/FI0AHQ
 Ybe+R4lLDwbHSgyJ5KJZhjiZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jspwM-0005NH-WD; Tue, 07 Jul 2020 15:55:27 +0000
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Subject: Re: Deprecate net -k?
Date: Tue, 07 Jul 2020 17:55:26 +0200
Message-ID: <7561779.ngQVxjjk1q@magrathea>
In-Reply-To: <7201cbce-7e3c-0fdf-6334-43443d3582e2@samba.org>
References: <CAC-fF8S_WZuALxjhjFKhYeaKjhrccjq2XG6k=db18o3RYFpWrA@mail.gmail.com>
 <7201cbce-7e3c-0fdf-6334-43443d3582e2@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 7 July 2020 13:08:26 CEST Stefan Metzmacher via samba-technical 
wrote:
> Hi Issac,

Hi Isaac :-)

> Andreas and I were working on a plan to unify the cmdline arguments
> for client authentication across all our commands (including python
> scripts). We should always get a cli_crendential structure out of
> the cmdline parsing and base all other code just on that.
> 
> Andreas, can you post our current plan?

Below is my current TODO list, it is a bit cryptic but should work for now.


WIP branch:
https://gitlab.com/samba-team/devel/samba/-/commits/asn/master-cli-creds


TODO
====

TEST:
-----

Add
echo locDCpass1 | bin/rpcclient ncacn_np:$SERVER -UAdministrator -c 
getusername 

echo locDCpass1 | USER=administrator bin/rpcclient ncacn_np:$SERVER -c 
getusername
-> DONE https://gitlab.com/samba-team/samba/-/merge_requests/1271

Migrate s3 client code to cli_credentials
-> DONE https://gitlab.com/samba-team/samba/-/merge_requests/1362


SMB.CONF:
---------

SMB_SIGNING_VALS="default|off|if_required|desired|required"
Create one function translating signing state string to enum
see set_cmdline_auth_info_signing_state and enum_smb_signing_vals

Add 'server smb encrypt' (done)
  -> smb encrypt as alias
Add 'client smb encrypt' (done)

Add cli_credentials_set_smb_singing(),
cli_credentials_set_smb_ipc_signing(),
cli_credentials_set_smb_encryption(). - DONE

Use cli_creds smb encryption:
tig -7 b06e7ea5cbc0e46c0c42d6cdeb3a14f3cf21f1c6 - DONE

Add smb encrytpion for source4/libcli - WIP


Check do_connect() in client.c


CMDLINE CLI:
------------

-> parse popts

-> set password callback, if not --use-krb5-ccache and not
   --use-ccache and not --no-pass and not auth-file

--use-kerberos=yes|auto|no|default
   default only if we add 'client use kerberos' as smb.conf option

--use-krb5-ccache
  imply --use-kerberos=yes
--krb5-cache=$PATH

'-U... -k' =>
   --use-kerberos=yes
'-k' without -U =>
   --use-krb5-cache

--use-krb5-ccache and --use-ccache
=> not supported,
   TODO: --use-winbind-ccache that provides
         generic support for krb5 and ntlm
Rename --use-ccache to --use-winbind-ccache (removes --use-ccache?)

Add --smb-signing=$SMB_SIGNING_VALS
 also set GENSEC_FEATURE_SIGN for desired/required
 --signing=$SMB_SIGNING_VALS (as legacy)
 '-S $SMB_SIGNING_VALS' ??? (only smbclient?)
 '-S' check what smbtorture is actually using
Remove -S for signing and use only long option

Add --smb-encryption=$SMB_SIGNING_VALS
-e => --smb-encryption=required
      also set GENSEC_FEATURE_SEAL??? => defer to --gensec-protection
Remove -e and use only long option

TODO: what about 'net'...
break it and use options as above?


Add the following???
--gensec-client-protection=[default,seal,sign,plain]
=> see also "ldap client sasl wrapping"
=> default from "gensec client protection"





-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



