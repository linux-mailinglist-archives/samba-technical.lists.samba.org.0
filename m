Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FB341EF4
	for <lists+samba-technical@lfdr.de>; Fri, 19 Mar 2021 15:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=TqqbVtWB6LM/wlj/Zm94A0tiumXfDSADHj/d83zSsp8=; b=gwaJCEmoH/QmEQr88xfKZNkYlT
	k0vU53v61VIC6fxkUZTHS6uNdsj/fpDPtGTjXq66h003a4JXmLzhZCOd8d2/7LgTdTA6Uo91dcigj
	ibrSwAtEVVUI9KIDoDRErk39Z3RfDNcTRUo2C3WS6JmY+ORUXvRZXk8ug1Vhi4OBD6onNfCI5vlDp
	pCsJtbEFnYOMm+KC1F4BJxgaq2WiY4GWOwtqzsK2oyVaAsJMuZyUcXVahLsEi4yiULuwN7kW4UwLB
	XwKxlBBAWwaAxrsNC3JqvgZJ2lQb1DhemWtY0UZKQHI/yuk8t3tZgLBKxT1gL8gak5EWI61BwtJVQ
	1AObVaFQ==;
Received: from ip6-localhost ([::1]:30248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lNFku-0062HX-Me; Fri, 19 Mar 2021 14:05:36 +0000
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net
 ([173.201.192.103]:41507) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lNFko-0062HQ-Fb
 for samba-technical@lists.samba.org; Fri, 19 Mar 2021 14:05:32 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id NFiXlbXRcBt9YNFiYlSQSH; Fri, 19 Mar 2021 07:03:10 -0700
X-CMAE-Analysis: v=2.4 cv=C/0sdSD+ c=1 sm=1 tr=0 ts=6054af1e
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=SEc3moZ4AAAA:8 a=3-RhneuVAAAA:8 a=eswUgBqCcl90HEgtvx8A:9
 a=QEXdDO2ut3YA:10 a=5oRCH6oROnRZc2VpWJZ3:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: [PATCH v3] cifs: Silently ignore unknown oplock break handle
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Steve French <sfrench@samba.org>
References: <20210319135711.11802-1-vincent.whitchurch@axis.com>
Message-ID: <4ebdf34a-bd01-68ad-6d27-b1c02d21aebe@talpey.com>
Date: Fri, 19 Mar 2021 10:03:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210319135711.11802-1-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCNVZxyNVbezDCGi8/jg/8PjvDCrHEwezT+McuGoN0CXy5Th5eqKF5XuMCO8hDLaNqnroiUHmRq7ntRMuzxwd/jiOvW0Fw4pcz2PHOTdcWOdcbyMgqCu
 bTbpqcmrgY5DOmSnY5TZzFQxR/BBIdCVaMwEA6mm5phg+NRQxCa8baUhnlY8qMMxO4RAyZc/1vOTRW5k3VezQGyJUh6a3eoAbOVdyFq439wpGkYLcptzBYV7
 VA9Mx/9N1Qc2XzPIdHVL7kTi7L1kxTV+YjiT78bjj0v9lYZA9nZyhu/suJCRM/4wgCe+III5k9pglpv5IEM8KImRuIRvtHZpCvX9LJbf51AuKKNSNh5lbmam
 rDBSBzC3OQOAMefOwCPEus5xkTJhlg==
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org, kernel@axis.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

LGTM feel free to add

Reviewed-By: Tom Talpey <tom@talpey.com>

On 3/19/2021 9:57 AM, Vincent Whitchurch wrote:
> Make SMB2 not print out an error when an oplock break is received for an
> unknown handle, similar to SMB1.  The debug message which is printed for
> these unknown handles may also be misleading, so fix that too.
> 
> The SMB2 lease break path is not affected by this patch.
> 
> Without this, a program which writes to a file from one thread, and
> opens, reads, and writes the same file from another thread triggers the
> below errors several times a minute when run against a Samba server
> configured with "smb2 leases = no".
> 
>   CIFS: VFS: \\192.168.0.1 No task to wake, unknown frame received! NumMids 2
>   00000000: 424d53fe 00000040 00000000 00000012  .SMB@...........
>   00000010: 00000001 00000000 ffffffff ffffffff  ................
>   00000020: 00000000 00000000 00000000 00000000  ................
>   00000030: 00000000 00000000 00000000 00000000  ................
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>      v3:
>      - Change debug print to Tom Talpey's suggestion
>      
>      v2:
>      - Drop change to lease break
>      - Rewrite commit message
> 
>   fs/cifs/smb2misc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 60d4bd1eae2b..76cd05b8d53b 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -754,8 +754,8 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>   		}
>   	}
>   	spin_unlock(&cifs_tcp_ses_lock);
> -	cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> -	return false;
> +	cifs_dbg(FYI, "No file id matched, oplock break ignored\n");
> +	return true;
>   }
>   
>   void
> 

