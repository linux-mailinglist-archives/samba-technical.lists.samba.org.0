Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF211D1C9C
	for <lists+samba-technical@lfdr.de>; Wed, 13 May 2020 19:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kiFP/oevrhHzNudr9C9m546J6G44vYXYrQXzer3OPv4=; b=G8nxUQeurYXZOrty/OmGBpSrDx
	wtqagVXdPbDGUYv6DQp8QDsCpwFCsy6/HSAc4C9BuzJKXkm337nGuqKp3xXhtMPmXIRAH1etjbtD0
	4eKDVMx1yHK7XKXXkDuVnmC7lAB+RmXr9K4mx0cMIMZLJ4hWYycGoAr4pTnahDsD1j7iz34pcwiLY
	m7O621+5Qxo7vv3P5zCuq6Dudo9K8Qu0VgsPCpdOgdZQ8zLwxfqKkNoAAnCdr6ea7nhNVBJicCn8+
	t6pERK8WB02xyacWxDf6AfnFf9aEqV+aZr28kXGMf0aAx8d46oIqWCqvz9zBxhzNCD8YyOOvYaV99
	+FSkOTNA==;
Received: from localhost ([::1]:39794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYvYN-004EEi-EF; Wed, 13 May 2020 17:52:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12442) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYvYJ-004EEb-DF
 for samba-technical@lists.samba.org; Wed, 13 May 2020 17:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kiFP/oevrhHzNudr9C9m546J6G44vYXYrQXzer3OPv4=; b=L+YHCVUBUv9UWboZ72ybjLcvHB
 pZBM0KM0LDKmAH7rVrLfNEPdFJdDBpD+mEEvr+tVKPEQhMyHpJnZP3aOgrU/Xg6iKSrWkk8zuJnj+
 MPltVoN1sFZOonwiDsth98p7BUZdSj6PiM9EAuK14KmeVTBT6muOlM6ei3Q+VExT6x0SYAPiGyL+A
 1VVo9nLLZT0C44xiWZrzLAQ0HUMqVMJHyKRsz7GakmqN9/eOfkpjPsDyX3+Hf8frRI3JMGFPnteBg
 XqZ+daI/XTVy4gsNOK9/cPFvcYRIuXUX1hjafYhUmFxoBubq5mao+xVdNBhMGKy+it77fb5EGRSVs
 aDrI0GzXVYdwn9X0m619b3WO8/vNF/o7DdWDuv6kGClpS8E/klx2tnUQUNfxeTmgxQo36zUpAkiwW
 i0BTOtgwxIFQreioyXA6Q74sGDJEzOsydDFHc70Q3asvL8CCxW121a24zYB7Ph6UBjqUdwyVz+Py2
 1mZhDayb+sjHdumHuWxZjQ4s;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYvYH-0002ty-8y; Wed, 13 May 2020 17:52:17 +0000
Date: Wed, 13 May 2020 10:52:11 -0700
To: Anubhav Rakshit <anubhav.rakshit@gmail.com>
Subject: Re: [RFC] SMB2 Compound related chain handling when generation of
 FileId has failed
Message-ID: <20200513175211.GA9585@jeremy-acer>
References: <CAGuNez7E0vnWH63JOxCny3eXJNj7DgA9AYRvoACYSZc922Ps0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGuNez7E0vnWH63JOxCny3eXJNj7DgA9AYRvoACYSZc922Ps0w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: hemanth.thummala@nutanix.com,
 "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 13, 2020 at 10:01:38PM +0530, Anubhav Rakshit via samba-technical wrote:
> Issue:
> We have a scenario where an application sends a Compound Related chain
> consisting of:
> SMB2_CREATE
> SMB2_IOCTL
> SMB2_SET_INFO
> SMB2_CLOSE
> 
> SMB2_CREATE failed with NT_STATUS_ACCESS_DENIED and subsequent
> requests all fail. In Samba they return NT_STATUS_FILE_CLOSED.
> 
> When I tried the same against a Win2k12 server, I noticed that all the
> failed requests of the chain would return NT_STATUS_ACCESS_DENIED.
> 
> I believe this behaviour is also mentioned in the [MS-SMB2] Specs
> 3.3.5.2.7.2: Handling Compounded Related Requests
> 
> “When the current operation requires a FileId and the previous
> operation either contains or generates a FileId, if the previous
> operation fails with an error, the server SHOULD<223> fail the current
> operation with the same error code returned by the previous
> operation.“
> 
> I have written a smbtorture test case to verify the above. I also
> propose the following fix. I am attaching code for your reference.
> Kindly let me know if the changes look reasonable.

> diff --git source3/smbd/globals.h source3/smbd/globals.h
> index e9bcf45..b85f41a 100644
> --- source3/smbd/globals.h
> +++ source3/smbd/globals.h
> @@ -776,6 +776,8 @@ struct smbd_smb2_request {
>         /* Should we encrypt? */
>         bool do_encryption;
>         bool compound_related;
> +       bool create_fail;
> +       NTSTATUS compound_create_err;

Rather than having an extra bool "create_fail" and
an NTSTATUS compound_create_err you can set
smb2req->compound_create_err = NT_STATUS_OK
on create success, and then just do:

  if (!NT_STATUS_IS_OK(smb2req->compound_create_err)) {
		return smbd_smb2_request_error(req,
			req->compound_create_err);
  }

I don't think you need the bool here.

Great detective work though !

Thanks,

Jeremy.

