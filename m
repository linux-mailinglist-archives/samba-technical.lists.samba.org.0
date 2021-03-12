Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CAF3393B8
	for <lists+samba-technical@lfdr.de>; Fri, 12 Mar 2021 17:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=2LO8ulk85dEorJ/HwEEsOrhpxLUGRV/EZ3ry+5jRVCE=; b=asMycZD80w21KWa9WkMa0E82xq
	HXajv1yR/jdZrndfgtKixHew7YWCjJNlCW6ZXNHx0LP/1Q6eAtfPTz5RfyKxsRum9Q0PIvJPD4TEv
	Zp1tiBM/C47S0y0QoxFtSzVV4h6r1zCBoG6EL1lwCbEjpd8ZaLdW0xZDe1hmWkNAVRugFEgiN9yJg
	Eo5/GtzGSuhVhLmKU/ODWCcHxiqn7cm9sp+UCx9FCEuN42JbkG9sZPhDciKxfd5A1G5cQAWXjRqkt
	vxCR1zi0rDAnB188BfBe8mwNBM3YYdPSbdmd0G8QouA5OSagB1fRkllWIIViZqhHA3mcjbzMl/u/N
	tYR/nhXg==;
Received: from ip6-localhost ([::1]:62480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKkqF-005I4j-2q; Fri, 12 Mar 2021 16:40:47 +0000
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
 ([173.201.193.233]:59684) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lKkq9-005I4c-Hf
 for samba-technical@lists.samba.org; Fri, 12 Mar 2021 16:40:44 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id KknqlbKw5ntfUKknrlVJyL; Fri, 12 Mar 2021 09:38:20 -0700
X-CMAE-Analysis: v=2.4 cv=QsybYX+d c=1 sm=1 tr=0 ts=604b98fc
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=z5RMfGb9hc22iln2zp0A:9 a=QEXdDO2ut3YA:10
 a=HvKuF1_PTVFglORKqfwH:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: [PATCH] CIFS: Prevent error log on spurious oplock break
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Steve French <smfrench@gmail.com>
References: <20210305094107.13743-1-vincent.whitchurch@axis.com>
 <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
 <CAN05THQtb5RY2ye7nkyWBjrXS+=usZCxUM7jBQG+JEpg_TQQTA@mail.gmail.com>
 <20210309134118.GA31041@axis.com>
 <CAH2r5mvuQivNXWiG_PmREp0w5qOWGS5WR_4UDQ0nfdz5KxRfzg@mail.gmail.com>
 <20210312114915.GA17130@axis.com>
Message-ID: <2819bccf-2501-2cbd-bef6-d9ccb4559f02@talpey.com>
Date: Fri, 12 Mar 2021 11:38:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210312114915.GA17130@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNb9I3rcFI3E6DwYmErlz72QidH6y3Xnbktz1nG0tSaGKbDiIns9qngicfVOc3h7lG1Q7fPB9IvTbuFstSd/+M9sPboZQhOelvOc1tBX0ILMPQuEUe6B
 3lZKGv0FQLegopbLzD/gyighTtZFdrB4/8pNq1svs0RDt4D/+O8M6rdXasfGtn5Y06mYoqzHxYWuXDVNS2xP4d9nOIB/o+k+OlMpD6MQu35OonLMOZawTz47
 97zAEs0QxeQRQa2EnibgnOxYBxdvRL6lhWtcgoFyoJvJmnHGYCEvl0OozJG8UZDVD7cF9IzVGNUtnhRpPeELT0niVhwWtD6ROSfFboogn57LT8gNIJvcrxMx
 5kFcsKsjd9Hf/TQE6jQg8TnhtsuyW57L6yCVltPXO22dgddncv2ACNQ+zkv4QhMjrcKl70owZJcEsSO3vmzNf2dH6PpEhJ3MoICax8+9vA0PoCMaHLI6mMm5
 WXenGH2aH5xNnFAOtrEti9DQuSkMR0rscIdemg==
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel <kernel@axis.com>, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/12/2021 6:49 AM, Vincent Whitchurch wrote:
> On Tue, Mar 09, 2021 at 04:29:14PM +0100, Steve French wrote:
>> On Tue, Mar 9, 2021, 07:42 Vincent Whitchurch via samba-technical <samba-technical@lists.samba.org<mailto:samba-technical@lists.samba.org>> wrote:
>>> Thank you for the suggestions.  In my case, I've only received some
>>> reports of this error being emitted very rarely (couple of times a month
>>> in our stability tests).  Right now it looks like the problem may only
>>> be with a particular NAS, and we're looking into triggering oplock
>>> breaks more often and catching the problem with some more logging.
>>
>> I lean toward reducing or skipping the logging of the 'normsl' (or at
>> least possible) race between close and oplock break.
>>
>> I see this eg spamming the log running xfstest 524
>>
>> Can you repro it as well running that?
> 
> I haven't run xfstests, but we figured out how to easily trigger the
> error in a normal use case in our application.  I can now easily get the
> errors to spam the logs with a small program which writes to a file from
> one thread in a loop and opens, reads, and closes the same file in
> another thread in a loop.  This is against a Samba server configured
> with "smb2 leases = no".
> 
> Logs show that the oplock break FileId is not found because of the race
> between close and oplock break which you mentioned, and in some cases
> because of another race between open and oplock break (the open was not
> completed since it was waiting on the response to GetInfo).
> 
> If this is unavoidable, I think it really would be nice to at least
> reduce the severity since it's scary-looking and so easy to trigger.
> 
> How about something like the below?  It prints an info message for the
> first unhandled oplock breaks once.

No, it's incorrect to state this:

	pr_info_once("Received oplock break for unknown file\n");

Oplocks are properties of handles, not files. If the handle is gone,
there's no processing, therefore silence is totally appropriate.

But beyond that, pr_info_once() would seem to be a bad way to signal it,
because the condition could happen many times, from many servers, on
many handles. What's so special about the first one?

Other issues (bad packet, etc) in break processing are worth logging
however. Remember though they will generally point to server issues,
not client, so they should be logged appropriately.

> (I'm not sure if the lease key path should be handled differently. If
>   the concerns about removing the message were primarily for that path,
>   perhaps my original patch but with the change to
>   smb2_is_valid_lease_break() dropped could be acceptable?)

Leases are very different from oplocks so the answer is definitely yes.
Leases really are about files, and have additional ownership semantics
which are not merely per-client.

Tom.

> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 3de3c5908a72..849c3721f8a2 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -256,7 +256,7 @@ struct smb_version_operations {
>   	void (*dump_share_caps)(struct seq_file *, struct cifs_tcon *);
>   	/* verify the message */
>   	int (*check_message)(char *, unsigned int, struct TCP_Server_Info *);
> -	bool (*is_oplock_break)(char *, struct TCP_Server_Info *);
> +	int (*is_oplock_break)(char *, struct TCP_Server_Info *);
>   	int (*handle_cancelled_mid)(char *, struct TCP_Server_Info *);
>   	void (*downgrade_oplock)(struct TCP_Server_Info *server,
>   				 struct cifsInodeInfo *cinode, __u32 oplock,
> diff --git a/fs/cifs/cifsproto.h b/fs/cifs/cifsproto.h
> index 75ce6f742b8d..2714b6cdf70a 100644
> --- a/fs/cifs/cifsproto.h
> +++ b/fs/cifs/cifsproto.h
> @@ -135,7 +135,7 @@ extern int SendReceiveBlockingLock(const unsigned int xid,
>   			int *bytes_returned);
>   extern int cifs_reconnect(struct TCP_Server_Info *server);
>   extern int checkSMB(char *buf, unsigned int len, struct TCP_Server_Info *srvr);
> -extern bool is_valid_oplock_break(char *, struct TCP_Server_Info *);
> +extern int is_valid_oplock_break(char *, struct TCP_Server_Info *);
>   extern bool backup_cred(struct cifs_sb_info *);
>   extern bool is_size_safe_to_change(struct cifsInodeInfo *, __u64 eof);
>   extern void cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 112692300fb6..5dc58f0c99b0 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -1009,6 +1009,8 @@ cifs_demultiplex_thread(void *p)
>   		server->lstrp = jiffies;
>   
>   		for (i = 0; i < num_mids; i++) {
> +			int oplockret = -EINVAL;
> +
>   			if (mids[i] != NULL) {
>   				mids[i]->resp_buf_size = server->pdu_size;
>   
> @@ -1020,17 +1022,24 @@ cifs_demultiplex_thread(void *p)
>   					mids[i]->callback(mids[i]);
>   
>   				cifs_mid_q_entry_release(mids[i]);
> -			} else if (server->ops->is_oplock_break &&
> -				   server->ops->is_oplock_break(bufs[i],
> -								server)) {
> -				smb2_add_credits_from_hdr(bufs[i], server);
> +				continue;
> +			}
> +
> +			if (server->ops->is_oplock_break)
> +				oplockret = server->ops->is_oplock_break(bufs[i], server);
> +
> +			smb2_add_credits_from_hdr(bufs[i], server);
> +
> +			if (oplockret == 0) {
>   				cifs_dbg(FYI, "Received oplock break\n");
> +			} else if (oplockret == -ENOENT) {
> +				pr_info_once("Received oplock break for unknown file\n");
> +				cifs_dbg(FYI, "Received oplock break for unknown file\n");
>   			} else {
>   				cifs_server_dbg(VFS, "No task to wake, unknown frame received! NumMids %d\n",
>   						atomic_read(&midCount));
>   				cifs_dump_mem("Received Data is: ", bufs[i],
>   					      HEADER_SIZE(server));
> -				smb2_add_credits_from_hdr(bufs[i], server);
>   #ifdef CONFIG_CIFS_DEBUG2
>   				if (server->ops->dump_detail)
>   					server->ops->dump_detail(bufs[i],
> diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
> index 82e176720ca6..ffcdefcb5661 100644
> --- a/fs/cifs/misc.c
> +++ b/fs/cifs/misc.c
> @@ -400,7 +400,7 @@ checkSMB(char *buf, unsigned int total_read, struct TCP_Server_Info *server)
>   	return 0;
>   }
>   
> -bool
> +int
>   is_valid_oplock_break(char *buffer, struct TCP_Server_Info *srv)
>   {
>   	struct smb_hdr *buf = (struct smb_hdr *)buffer;
> @@ -435,17 +435,17 @@ is_valid_oplock_break(char *buffer, struct TCP_Server_Info *srv)
>   				 pnotify->FileName, pnotify->Action);
>   			/*   cifs_dump_mem("Rcvd notify Data: ",buf,
>   				sizeof(struct smb_hdr)+60); */
> -			return true;
> +			return 0;
>   		}
>   		if (pSMBr->hdr.Status.CifsError) {
>   			cifs_dbg(FYI, "notify err 0x%x\n",
>   				 pSMBr->hdr.Status.CifsError);
> -			return true;
> +			return 0;
>   		}
> -		return false;
> +		return -EINVAL;
>   	}
>   	if (pSMB->hdr.Command != SMB_COM_LOCKING_ANDX)
> -		return false;
> +		return -EINVAL;
>   	if (pSMB->hdr.Flags & SMBFLG_RESPONSE) {
>   		/* no sense logging error on invalid handle on oplock
>   		   break - harmless race between close request and oplock
> @@ -454,21 +454,21 @@ is_valid_oplock_break(char *buffer, struct TCP_Server_Info *srv)
>   		if ((NT_STATUS_INVALID_HANDLE) ==
>   		   le32_to_cpu(pSMB->hdr.Status.CifsError)) {
>   			cifs_dbg(FYI, "Invalid handle on oplock break\n");
> -			return true;
> +			return 0;
>   		} else if (ERRbadfid ==
>   		   le16_to_cpu(pSMB->hdr.Status.DosError.Error)) {
> -			return true;
> +			return 0;
>   		} else {
> -			return false; /* on valid oplock brk we get "request" */
> +			return -EINVAL; /* on valid oplock brk we get "request" */
>   		}
>   	}
>   	if (pSMB->hdr.WordCount != 8)
> -		return false;
> +		return -EINVAL;
>   
>   	cifs_dbg(FYI, "oplock type 0x%x level 0x%x\n",
>   		 pSMB->LockType, pSMB->OplockLevel);
>   	if (!(pSMB->LockType & LOCKING_ANDX_OPLOCK_RELEASE))
> -		return false;
> +		return -EINVAL;
>   
>   	/* look up tcon based on tid & uid */
>   	spin_lock(&cifs_tcp_ses_lock);
> @@ -500,17 +500,17 @@ is_valid_oplock_break(char *buffer, struct TCP_Server_Info *srv)
>   
>   				spin_unlock(&tcon->open_file_lock);
>   				spin_unlock(&cifs_tcp_ses_lock);
> -				return true;
> +				return 0;
>   			}
>   			spin_unlock(&tcon->open_file_lock);
>   			spin_unlock(&cifs_tcp_ses_lock);
>   			cifs_dbg(FYI, "No matching file for oplock break\n");
> -			return true;
> +			return 0;
>   		}
>   	}
>   	spin_unlock(&cifs_tcp_ses_lock);
>   	cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> -	return true;
> +	return 0;
>   }
>   
>   void
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 60d4bd1eae2b..066cc8ce128e 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -614,7 +614,7 @@ smb2_tcon_find_pending_open_lease(struct cifs_tcon *tcon,
>   	return found;
>   }
>   
> -static bool
> +static int
>   smb2_is_valid_lease_break(char *buffer)
>   {
>   	struct smb2_lease_break *rsp = (struct smb2_lease_break *)buffer;
> @@ -643,7 +643,7 @@ smb2_is_valid_lease_break(char *buffer)
>   				if (smb2_tcon_has_lease(tcon, rsp)) {
>   					spin_unlock(&tcon->open_file_lock);
>   					spin_unlock(&cifs_tcp_ses_lock);
> -					return true;
> +					return 0;
>   				}
>   				open = smb2_tcon_find_pending_open_lease(tcon,
>   									 rsp);
> @@ -659,7 +659,7 @@ smb2_is_valid_lease_break(char *buffer)
>   					smb2_queue_pending_open_break(tlink,
>   								      lease_key,
>   								      rsp->NewLeaseState);
> -					return true;
> +					return 0;
>   				}
>   				spin_unlock(&tcon->open_file_lock);
>   
> @@ -672,17 +672,17 @@ smb2_is_valid_lease_break(char *buffer)
>   					queue_work(cifsiod_wq,
>   						   &tcon->crfid.lease_break);
>   					spin_unlock(&cifs_tcp_ses_lock);
> -					return true;
> +					return 0;
>   				}
>   			}
>   		}
>   	}
>   	spin_unlock(&cifs_tcp_ses_lock);
>   	cifs_dbg(FYI, "Can not process lease break - no lease matched\n");
> -	return false;
> +	return -ENOENT;
>   }
>   
> -bool
> +int
>   smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>   {
>   	struct smb2_oplock_break *rsp = (struct smb2_oplock_break *)buffer;
> @@ -695,14 +695,14 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>   	cifs_dbg(FYI, "Checking for oplock break\n");
>   
>   	if (rsp->sync_hdr.Command != SMB2_OPLOCK_BREAK)
> -		return false;
> +		return -EINVAL;
>   
>   	if (rsp->StructureSize !=
>   				smb2_rsp_struct_sizes[SMB2_OPLOCK_BREAK_HE]) {
>   		if (le16_to_cpu(rsp->StructureSize) == 44)
>   			return smb2_is_valid_lease_break(buffer);
>   		else
> -			return false;
> +			return -EINVAL;
>   	}
>   
>   	cifs_dbg(FYI, "oplock level 0x%x\n", rsp->OplockLevel);
> @@ -748,14 +748,14 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>   
>   				spin_unlock(&tcon->open_file_lock);
>   				spin_unlock(&cifs_tcp_ses_lock);
> -				return true;
> +				return 0;
>   			}
>   			spin_unlock(&tcon->open_file_lock);
>   		}
>   	}
>   	spin_unlock(&cifs_tcp_ses_lock);
>   	cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> -	return false;
> +	return -ENOENT;
>   }
>   
>   void
> diff --git a/fs/cifs/smb2proto.h b/fs/cifs/smb2proto.h
> index 9565e27681a5..b01da9283fe6 100644
> --- a/fs/cifs/smb2proto.h
> +++ b/fs/cifs/smb2proto.h
> @@ -62,7 +62,7 @@ extern int smb3_calc_signature(struct smb_rqst *rqst,
>   				bool allocate_crypto);
>   extern void smb2_echo_request(struct work_struct *work);
>   extern __le32 smb2_get_lease_state(struct cifsInodeInfo *cinode);
> -extern bool smb2_is_valid_oplock_break(char *buffer,
> +extern int smb2_is_valid_oplock_break(char *buffer,
>   				       struct TCP_Server_Info *srv);
>   extern struct cifs_ses *smb2_find_smb_ses(struct TCP_Server_Info *server,
>   					  __u64 ses_id);
> 

